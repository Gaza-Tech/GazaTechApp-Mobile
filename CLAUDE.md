# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> Developer guide for Claude Code when working in this Flutter repository.
> Treat this as the source of truth for architecture, conventions, and workflow.

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
15. [Testing](#testing)
16. [Git Workflow](#git-workflow)
17. [CI/CD](#cicd)

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
│   ├── services/       # Cross-feature singletons (BookmarkEventService)
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
Each sub-feature follows the same `cubit/data/ui` pattern.

**Current non-auth features and their routes:**

| Feature | Route constant | Notes |
|---|---|---|
| `home` | `MyRoutes.home` | Shell — hosts `MarketplaceCubit`, `CommunityCubit`, `SignOutCubit` |
| `marketplace` | _(tab in home)_ | Listing feed with filter/sort |
| `listing_details` | `MyRoutes.listingDetails` | Arg: `String` listingId |
| `add_listing` | `MyRoutes.addListing` | Image picker, categories, locations |
| `search` | `MyRoutes.search` | Marketplace keyword + filter search |
| `community` | _(tab in home)_ | Post feed |
| `community_search` | `MyRoutes.communitySearch` | Post keyword search |
| `add_post` | `MyRoutes.createPost` | Create community post |
| `profile` | `MyRoutes.profile` | Arg: `Map<String,dynamic>` — `userId`, `isOwnProfile` |
| `edit_profile` | `MyRoutes.editProfile` | Arg: `UserProfileModel` |
| `bookmarks` | `MyRoutes.bookmarks` | Saved listings + posts |
| `verification` | `MyRoutes.verificationForm` / `verificationStatus` | User identity verification |

**Rule**: When a pattern appears in 2+ features, move it to `core/widgets/`.

**Available `core/widgets/`** — check before creating anything new:
`MyButton`, `MyTextFormField`, `MyOtpFormField`, `TappableSearchBar`, `SearchAppBar`, `SortButton`, `ChipSelector`, `ActiveFiltersBar`, `FilterSheetShell`, `ConditionTag`, `RecentSearchesView`, `SpacingWidgets`, `StatusBarHider`, `LanguageSwitcher`, `GoogleSignInButton`

---

## Architecture & Data Flow

Unidirectional flow — no shortcuts:

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
| **Cubit** | Orchestrates logic. Emits Freezed states. |
| **UI** | Reacts to states via `BlocBuilder` / `BlocListener`. No business logic. |

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

- After creating or modifying any Freezed class, run build_runner.
- Form `TextEditingController`s and `GlobalKey<FormState>` live in the **Cubit**, not in the UI.
- Emit `loading` before any async call. Always emit `success` or `failure` after.
- Never store UI context inside a Cubit.

---

## Dependency Injection

Uses `get_it`. All registrations are in `lib/core/di/injection.dart`.

**Registration order per feature:**
```dart
// 1. ApiService
getIt.registerLazySingleton<FeatureApiService>(
  () => FeatureApiService(getIt<SupabaseClient>()),
);

// 2. Repository
getIt.registerLazySingleton<FeatureRepo>(
  () => FeatureRepo(getIt<FeatureApiService>()),
);

// 3. Cubit (factory — new instance per screen)
getIt.registerFactory<FeatureCubit>(
  () => FeatureCubit(getIt<FeatureRepo>()),
);

// For cubits needing constructor params:
getIt.registerFactoryParam<FeatureCubit, String, void>(
  (param, _) => FeatureCubit(getIt<FeatureRepo>(), param),
);
```

Access via: `getIt<Type>()` or `getIt<Type>(param1: value)`.

---

## Routing

- Route name constants: `lib/core/routes/my_routes.dart`
- `generateRoute` in `lib/core/routes/my_router.dart` — wraps screens with `BlocProvider` / `MultiBlocProvider`
- Arguments passed via `settings.arguments`, cast at the route level
- Initial route determined by Supabase auth session check in `main.dart`

**When adding a new screen:**
1. Add route constant to `my_routes.dart`
2. Add `case` in `generateRoute` with the correct `BlocProvider`
3. Register Cubit/Repo/Service in `injection.dart`

---

## API Handling & Error Handling

**ApiResult** — Freezed union wrapping all repository returns:
```dart
@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data)          = Success;
  const factory ApiResult.failure(ApiErrorModel error) = Failure;
}
```

**Repository pattern:**
```dart
Future<ApiResult<T>> doSomething() async {
  try {
    final result = await _apiService.doSomething();
    return ApiResult.success(result);
  } catch (e) {
    return ApiResult.failure(ErrorHandler.handle(e));
  }
}
```

- `ErrorHandler.handle()` is in `lib/core/netowoks/supabase_error_handler.dart`
- It converts `AuthException` and `PostgrestException` into `ApiErrorModel`
- Never expose raw exceptions to the UI layer
- Always handle `.failure` in the Cubit and emit a `failure` state with a user-readable message

---

## Local Storage

- **SharedPreferences** — for simple key-value data (auth tokens, locale, theme preference)
  - Key constants live in `lib/core/cache/`
  - Access via `SharedPrefHelper` wrapper — never call `SharedPreferences.getInstance()` directly in feature code
- **Isar / SQLite** — use for structured local data or offline-first features (not yet in project; add to `core/` if introduced)
- Never store sensitive credentials in local storage. Use platform-secure storage (e.g., `flutter_secure_storage`) for tokens if needed.

---

## Localization

- ARB files: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`
- Config: `l10n.yaml`; generated class: `AppLocalizations`
- Access: `AppLocalizations.of(context)!.stringKey`
- RTL support: `LocaleCubit` + `LocaleHelper.getTextDirection()` applied in `main.dart` builder
- **All user-facing strings must be localized** — no hardcoded English or Arabic strings in widgets
- After adding new keys to both ARB files, run `flutter gen-l10n`

---

## Naming Conventions

| Item | Convention | Example |
|---|---|---|
| Files | `snake_case` | `product_card.dart` |
| Classes | `PascalCase` | `ProductCard` |
| Variables / methods | `camelCase` | `fetchProducts()` |
| Constants | `camelCase` (or `kCamelCase`) | `kPrimaryColor` |
| Private members | `_camelCase` | `_isLoading` |
| Cubit | `FeatureCubit` | `ProductCubit` |
| State | `FeatureState` | `ProductState` |
| Repository | `FeatureRepo` | `ProductRepo` |
| ApiService | `FeatureApiService` | `ProductApiService` |
| Screen widget | `FeatureScreen` | `ProductScreen` |
| Route constant | `routeFeature` | `routeProduct` |

---

## Code Style & Formatting

- Run `dart format .` before committing (enforced in CI)
- Max line length: **100 characters**
- Use `flutter analyze` and fix all warnings before opening a PR
- Avoid `dynamic` — always type explicitly
- Avoid `late` unless initialization is guaranteed (prefer nullable + null check)
- Prefer `final` over `var`; use `const` wherever possible
- No commented-out code in merged branches — delete it or track it in an issue
- One `import` block: Dart → Flutter → packages → local (separated by blank lines)
- Remove unused imports immediately

---

## Widget Cleanliness Rules

- **File length target**: Keep every `.dart` file under ~150 lines. Exceeding this is a signal to extract.
- **One widget class per file** — never co-locate unrelated widgets.
- **No deep inline nesting**: Any subtree deeper than 3 levels or longer than ~30 lines must be extracted.
  - Use a **private `_buildX()` method** for simple, stateless, parameter-free fragments.
  - Use a **dedicated widget class** for anything with parameters, state, or reuse potential.
- **Extract to the right place**:
  - Feature-specific → `feature/ui/widgets/`
  - Used in 2+ features → `lib/core/widgets/`
- **Check `core/widgets/` first** before creating anything new (`MyButton`, `MyTextFormField`, etc.)
- **Prefer `const` constructors** everywhere — it's free performance.
- `BlocListener`s belong in `ui/widgets/` or at the top of the screen, not buried inside build trees.

---

## UI/UX & Theming Guidelines

- **Design size**: `375×812` (flutter_screenutil) — use `.w`, `.h`, `.sp`, `.r` for all sizing
- **Font**: IBMPlexSansArabic (Arabic-first design)
- **Theme**: Supports light/dark via system — defined in `lib/core/theme/`
  - Never hardcode colors — always reference theme tokens or constants from `AppColors`
  - Never hardcode text styles — reference `AppTextStyles`
- **Responsive**:
  - Test on at least two screen sizes (small phone + large phone)
  - Never use fixed pixel heights for list items or cards
- **Loading states**: Every async action must show a visual loading indicator
- **Empty states**: Every list/feed must handle empty data gracefully with a message or illustration
- **Error states**: Surface user-readable error messages — never show raw exception text
- **Accessibility**: Use `Semantics` labels on icon-only buttons; ensure tap targets are ≥ 48×48 px

---

## Performance Best Practices

- Use `const` constructors wherever possible — prevents unnecessary rebuilds
- Scope `BlocBuilder` tightly — wrap only the widget that actually needs to rebuild
- Use `buildWhen` in `BlocBuilder` to skip irrelevant state changes
- Use `ListView.builder` / `SliverList` — never `ListView(children: [...])` for dynamic lists
- Avoid rebuilding entire screens; extract stateful parts into smaller widgets
- Lazy-load images with `CachedNetworkImage`; always provide a placeholder and error widget
- Avoid heavy computation in `build()` — move it to the Cubit or a helper
- Profile with Flutter DevTools before assuming something is slow

---

## Testing

Aim for meaningful coverage, not 100% coverage theater.

**Unit tests** — for Cubits and Repositories:
```
test/
└── features/
    └── feature_name/
        ├── cubit/feature_cubit_test.dart
        └── data/repos/feature_repo_test.dart
```

- Mock dependencies with `mocktail` or `mockito`
- Test every state transition in a Cubit (initial → loading → success / failure)
- Test Repository error-handling paths (what happens on exception)

**Widget tests** — for reusable `core/widgets/`:
- Verify widget renders correctly for key states
- Verify tap callbacks fire

**Integration tests** — for critical user flows (auth, checkout, etc.) as the project matures.

**Rules:**
- Tests live in `test/` mirroring `lib/` structure
- No `print` statements in tests
- A PR that breaks existing tests cannot be merged

---

## Git Workflow

**Branch model** (Git Flow):

| Branch | Purpose |
|---|---|
| `main` | Production-ready code only |
| `dev` | Integration branch — all features merge here first |
| `feature/short-description` | One feature or fix per branch |
| `fix/short-description` | Bug fixes |
| `chore/short-description` | Non-functional changes (deps, config, docs) |

**Rules:**
- Branch off `dev`, not `main`
- PR into `dev`; `dev` → `main` only for releases
- Require at least one approval before merging
- Squash-merge feature branches to keep `dev` history clean

**Commit messages** (Conventional Commits):

```
<type>(<scope>): <short imperative description>

Types: feat | fix | refactor | style | test | chore | docs | perf
Scope: optional, matches the feature name (auth, product, cart, etc.)

Examples:
feat(auth): add Google sign-in flow
fix(product): correct price formatting for Arabic locale
refactor(cart): extract CartItemCard into separate widget
chore: upgrade flutter_bloc to 9.0.0
test(auth): add sign-in cubit state transition tests
```

- Subject line ≤ 72 characters
- Use imperative mood ("add", not "added" or "adding")
- Reference issue numbers in the body if applicable: `Closes #42`

---

## CI/CD

**GitHub Actions** — run on every PR targeting `dev` or `main`:

```yaml
# Recommended checks
- flutter pub get
- flutter pub run build_runner build --delete-conflicting-outputs
- flutter gen-l10n
- flutter analyze
- flutter test
- dart format --set-exit-if-changed .
```

**Rules:**
- All CI checks must pass before a PR can be merged
- No force-pushes to `main` or `dev`
- Tag releases on `main` using semantic versioning: `v1.0.0`, `v1.1.0`, `v2.0.0`

---

*Last updated by project lead. Update this file whenever the architecture, tooling, or conventions change.*