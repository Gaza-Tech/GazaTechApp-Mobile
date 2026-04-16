# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> Treat this as the source of truth for architecture, conventions, and workflow.
> Apply the Golden Test before modifying this file: "Would removing this rule cause Claude to make mistakes?" 

---

## Table of Contents

1. [Commands](#commands)
2. [Project Structure](#project-structure)
3. [Architecture & Data Flow](#architecture--data-flow)
4. [State Management](#state-management)
5. [Dependency Injection](#dependency-injection)
6. [Routing](#routing)
7. [API Handling & Error Handling](#api-handling--error-handling)
8. [Local Storage](#local-storage)
9. [Localization](#localization)
10. [Naming Conventions](#naming-conventions)
11. [Code Style & Formatting](#code-style--formatting)
12. [Widget Cleanliness Rules](#widget-cleanliness-rules)
13. [UI/UX & Theming Guidelines](#uiux--theming-guidelines)
14. [Performance Best Practices](#performance-best-practices)
15. [Security](#security)
16. [Testing](#testing)
17. [Git Workflow](#git-workflow)
18. [CI/CD](#cicd)
19. [AI Workflow Rules](#ai-workflow-rules)

---

## Commands

```bash
# Install dependencies
flutter pub get

# Generate Freezed/JSON code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode during active development
flutter pub run build_runner watch --delete-conflicting-outputs

# Generate localization files
flutter gen-l10n

# Run the app
flutter run

# Check formatting (CI uses --set-exit-if-changed)
dart format .

# Static analysis
flutter analyze

# Run all tests
flutter test

# Run a single test file
flutter test test/path/to/test.dart
```

**Environment setup** — create `.env` in the project root:
```
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

---

## Project Structure

Feature-first layout. Each feature is self-contained.

```
lib/
├── core/
│   ├── cache/          # SharedPreferences key constants
│   ├── di/             # GetIt registrations (injection.dart)
│   ├── extentions/     # BuildContext extensions (Navigation, l10n shorthand)
│   │                   # Note: directory is intentionally spelled "extentions" — do not rename
│   ├── helpers/        # ValidatorHelper, SharedPrefHelper, LocaleHelper, UrlLauncherHelper
│   ├── netowoks/       # Error handler, ApiResult, Supabase config
│   │                   # Note: directory is intentionally spelled "netowoks" — do not rename
│   ├── routes/         # my_routes.dart (constants), my_router.dart (generateRoute)
│   ├── services/       # Cross-feature event buses (PostEventService, ReportEventService)
│   ├── theme/          # Colors, text styles, ThemeData
│   └── widgets/        # Shared/reusable widgets (see list below)
│
├── features/
│   └── feature_name/
│       ├── cubit/
│       │   ├── feature_cubit.dart     # Business logic
│       │   └── feature_state.dart     # Freezed states
│       ├── data/
│       │   ├── models/                # Request/response models (Freezed + JSON)
│       │   ├── repos/                 # Repository — wraps service, returns ApiResult<T>
│       │   └── services/              # ApiService — direct Supabase calls
│       └── ui/
│           ├── feature_screen.dart    # Main screen widget
│           └── widgets/               # Screen-specific extracted widgets
│
└── main.dart
```

**Auth** is nested deeper:
`lib/features/auth/{sign_in,sign_up,verify_otp,forgot_password,reset_password,google_auth,sign_out}/`

**Current non-auth features and their routes:**
* `home` | `MyRoutes.home` (Shell — hosts `MarketplaceCubit`, `CommunityCubit`, `SignOutCubit`)
* `marketplace` | _(tab in home)_ 
* `listing_details` | `MyRoutes.listingDetails` (Arg: `String` listingId)
* `add_listing` | `MyRoutes.addListing`
* `search` | `MyRoutes.search` 
* `community` | _(tab in home)_
* `community_search` | `MyRoutes.communitySearch`
* `add_post` | `MyRoutes.createPost`
* `profile` | `MyRoutes.profile` (Arg: `Map<String,dynamic>`)
* `edit_profile` | `MyRoutes.editProfile`
* `bookmarks` | `MyRoutes.bookmarks`
* `verification` | `MyRoutes.verificationForm` / `verificationStatus`

**Rule (IMPORTANT):** Any reusable logic, utility, constant, extension, or widget used in 2+ places goes in `core/`. Check `core/` before creating new shared code — never duplicate across features.

**Available `core/widgets/`:**
`MyButton`, `MyTextFormField`, `MyOtpFormField`, `TappableSearchBar`, `SearchAppBar`, `SortButton`, `ChipSelector`, `ActiveFiltersBar`, `FilterSheetShell`, `ConditionTag`, `RecentSearchesView`, `SpacingWidgets`, `StatusBarHider`, `LanguageSwitcher`, `GoogleSignInButton`, `DeleteConfirmationSheet`, `ConfirmationSheet`, `SignUpPromptSheet`, `ImagePickerGrid`

---

## Architecture & Data Flow

Follow the project's architecture layer boundaries strictly. Unidirectional flow — no shortcuts:

```
UI (Screen)
  └── Cubit
        └── Repository
              └── ApiService
                    └── Supabase
```

| Layer | Responsibility |
|---|---|
| **ApiService** | Direct Supabase calls. Receives `SupabaseClient` via DI. No error handling here. |
| **Repository** | Wraps ApiService in try/catch. Returns `ApiResult<T>`. |
| **Cubit** | Orchestrates logic. Emits Freezed states. **Must have ZERO `package:flutter` imports.** |
| **UI** | Reacts to states. **ZERO business logic** — only rendering, interaction, and state observation. |

**Change Discipline:**
- Make the smallest change that solves the problem.
- Fix root causes, not symptoms.
- Don't refactor unrelated code unless explicitly requested.
- Never break existing functionality, APIs, flows, or UX unless explicitly instructed.
- Read relevant code before modifying it — state assumptions when unclear.

---

## State Management

Use **Cubit** (preferred for simple flows) or **Bloc** (for event-driven, complex flows).

**Standard state pattern** — all Cubits follow this Freezed union:

```dart
@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState.initial()              = _Initial;
  const factory FeatureState.loading()              = _Loading;
  const factory FeatureState.success(DataType data) = _Success;
  const factory FeatureState.failure(String message)= _Failure;
}
```

- After creating or modifying any Freezed class, run `build_runner`.
- Form `TextEditingController`s and `GlobalKey<FormState>` live in the **Cubit**, not in the UI.
- Emit `loading` before any async call. Always emit `success` or `failure` after.
- Never store UI context inside a Cubit.
- **`setState` Rule:** Allowed ONLY for local UI state (e.g., toggles, form focus) — never for business logic. Keep `setState` scoped to the smallest widget possible.

---

## Dependency Injection

Uses `get_it`. All registrations are in `lib/core/di/injection.dart`.

**Registration order per feature:**
1.  **ApiService:** `getIt.registerLazySingleton<FeatureApiService>(...)`
2.  **Repository:** `getIt.registerLazySingleton<FeatureRepo>(...)`
3.  **Cubit:** `getIt.registerFactory<FeatureCubit>(...)` (new instance per screen)

Access via: `getIt<Type>()` or `getIt<Type>(param1: value)`. Never instantiate these manually in the UI.

---

## Routing

- Route name constants: `lib/core/routes/my_routes.dart`
- `generateRoute` in `lib/core/routes/my_router.dart` — wraps screens with `BlocProvider`
- Arguments passed via `settings.arguments`, cast at the route level
- Initial route determined by Supabase auth session check in `main.dart`

---

## API Handling & Error Handling

Errors flow cleanly across layers — never skip layers or fail silently.

**ApiResult** — Freezed union wrapping all repository returns:
```dart
@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data)          = Success;
  const factory ApiResult.failure(ApiErrorModel error) = Failure;
}
```

- **Data Layer:** Catch exceptions (`AuthException`, `PostgrestException`) in the Repository and map them using `ErrorHandler.handle()` to return an `ApiResult.failure()`.
- **Domain/Cubit Layer:** Handle `.failure` and emit a `FeatureState.failure` with a user-readable message.
- **UI Layer:** Map failures to user-friendly messages and UI states. Never expose raw exceptions.

**Soft-delete pattern:** Posts and listings use `content_status` field (`'published'`, `'draft'`, `'removed'`). All fetch queries **must** filter `.eq('content_status', 'published')` to exclude soft-deleted content. When querying through joins (e.g., bookmarks), use PostgREST dot notation: `.eq('joined_table.content_status', 'published')`.

**Guest guard pattern:** Anonymous (guest) users can browse but not perform write actions. Gate write actions with `GuestGuard.requireAccount(context)` — returns `false` for guests (shows sign-up prompt), `true` for real accounts. See `lib/core/helpers/guest_guard.dart`.

---

## Local Storage

- **SharedPreferences** — for simple key-value data. Key constants live in `lib/core/cache/`. Access via `SharedPrefHelper` wrapper.
- Never store sensitive credentials in local storage. Use platform-secure storage for tokens if needed.

---

## Localization

- ARB files: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`
- Config: `l10n.yaml`; generated class: `AppLocalizations`
- Access: `AppLocalizations.of(context)!.stringKey`
- RTL support: `LocaleCubit` + `LocaleHelper.getTextDirection()`
- **All user-facing strings must be localized.** Run `flutter gen-l10n` after adding new keys to both files.

---

## Naming Conventions

* Files: `snake_case`
* Classes/Widgets: `PascalCase`
* Variables/Methods: `camelCase`
* Constants: `camelCase` (or `kCamelCase`)
* Private members: `_camelCase`

---

## Code Style & Formatting

- Max line length: **100 characters**.
- Use `dart format .` and `flutter analyze`. Fix all warnings before opening a PR.
- Avoid `dynamic` — always type explicitly.
- Avoid `late` unless initialization is guaranteed (prefer nullable + null check).
- Prefer `final` over `var`; use `const` wherever possible.
- No commented-out code in merged branches.
- Don't add new packages without justification. Any new package must be stable and production-grade.

---

## Widget Cleanliness Rules (IMPORTANT)

- **Build Method Discipline:** NEVER create `TextEditingController`, `AnimationController`, `FocusNode`, or other expensive objects inside `build()`. Dispose of them properly in `dispose()`.
- **Scoping:** Use `BlocBuilder`/`BlocSelector` on the smallest widget that needs the state — never at the top of the tree.
- **File length target**: Keep `.dart` files under ~150 lines. Exceeding this signals a need to extract.
- **One widget class per file**.
- **No deep inline nesting**: Extract subtrees deeper than 3 levels or ~30 lines. Use a private `_buildX()` method for stateless fragments, or a dedicated class for parameterized ones.
- **Prefer `const` constructors** everywhere — it's free performance.
- `BlocListener`s belong in `ui/widgets/` or at the top of the screen, not buried inside build trees.

---

## UI/UX & Theming Guidelines

- **Design size**: `375×812` (`flutter_screenutil`) — use `.w`, `.h`, `.sp`, `.r`.
- **Font**: IBMPlexSansArabic.
- **Theme**: Defined in `lib/core/theme/`. Never hardcode colors or text styles — reference `AppColors` and `AppTextStyles`.
- **States:** Every async action must show a loading indicator. Empty lists must have a message/illustration.

---

## Performance Best Practices

- Scope `BlocBuilder` tightly and use `buildWhen` to skip irrelevant state changes.
- Use `ListView.builder` / `SliverList` for dynamic lists.
- Lazy-load images with `CachedNetworkImage` (provide placeholder/error widget).
- Avoid heavy computation in `build()` — move it to the Cubit or a helper.

---

## Security

- Never hardcode secrets, tokens, or credentials.
- Never log sensitive information or user PII.
- Validate all external and API input.
- Proactively flag security risks when spotted during code generation or review.

---

## Testing

Aim for meaningful coverage, not 100% coverage theater. Tests must be deterministic — no flaky or timing-dependent tests. Test one behavior per test case.

**Unit tests** (`test/features/.../`):
- Mock dependencies with `mocktail` or `mockito`.
- Test every state transition in a Cubit (initial → loading → success / failure).
- Test Repository error-handling paths.

**Widget tests** (`test/core/widgets/`):
- Verify widget renders correctly for key states and tap callbacks fire.

---

## Git Workflow

**Branch model** (Git Flow):
`main` (Production) | `dev` (Integration) | `feature/name` | `fix/name` | `chore/name`

- Branch off `dev`. PR into `dev`. Require 1 approval. Squash-merge features.
- **Conventional Commits:** `<type>(<scope>): <short imperative description>` (e.g., `feat(auth): add Google sign-in`).

---

## CI/CD

**GitHub Actions** (targets `dev` / `main` PRs):
Must pass `pub get`, `build_runner`, `gen-l10n`, `dart format --set-exit-if-changed .`, and `analyze`. No force-pushes.

---

## AI Workflow Rules (Mandatory)

When acting as an autonomous agent in this repository:
1.  **Before marking any task done:** Run the `/code-review` skill to verify your changes against these guidelines.
2.  **After task approval:** Run the `/create-pr` skill for branch creation, committing, and generating PR output.
3.  **PR Format:** PR descriptions must always be provided in markdown (`.md`) format.