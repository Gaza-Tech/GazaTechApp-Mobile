# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Install dependencies
flutter pub get

# Generate freezed code (states, models)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for code generation (during development)
flutter pub run build_runner watch --delete-conflicting-outputs

# Generate localization files
flutter gen-l10n

# Run the app
flutter run

# Run linter
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/path_to_test.dart
```

## Environment Setup

Create a `.env` file in the project root with:
```
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

## Architecture Overview

### Feature-First Structure
Each feature in `lib/features/` follows a consistent layered pattern:

```
feature_name/
├── cubit/
│   ├── feature_cubit.dart      # BLoC/Cubit logic
│   └── feature_state.dart      # Freezed state definitions
├── data/
│   ├── models/                 # Request/response models
│   ├── repos/                  # Repository (wraps API service with error handling)
│   └── services/               # API service (direct Supabase calls)
└── ui/
    ├── feature_screen.dart     # Main screen widget
    └── widgets/                # Feature-specific widgets (including BlocListeners)
```

Auth is nested one level deeper: `lib/features/auth/{sign_in,sign_up,verify_otp,forgot_password,reset_password,google_auth,sign_out}/` — each sub-feature follows the same cubit/data/ui pattern.

### Data Flow
`UI (Screen) → Cubit → Repository → ApiService → Supabase`

- **ApiService**: Direct Supabase client calls (receives `SupabaseClient` via DI)
- **Repository**: Wraps ApiService in try/catch, returns `ApiResult<T>` (success/failure using `ErrorHandler.handle()`)
- **Cubit**: Business logic, emits freezed states (initial/loading/success/failure)
- **UI**: BlocBuilder/BlocListener for state changes

### State Pattern (Freezed)
All Cubit states use this pattern:
```dart
@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = _Initial;
  const factory FeatureState.loading() = Loading;
  const factory FeatureState.success(DataType data) = Success;
  const factory FeatureState.failure(String message) = Failure;
}
```

After creating/modifying freezed classes, run `flutter pub run build_runner build --delete-conflicting-outputs` to regenerate `.freezed.dart` and `.g.dart` files.

### Dependency Injection
- Uses `get_it` package, all registrations in `lib/core/di/injection.dart`
- Pattern: Register ApiService (lazySingleton) → Repository (lazySingleton) → Cubit (factory)
- Cubits use `registerFactory` (new instance per screen) or `registerFactoryParam` when they need constructor args (e.g., email)
- Access via `getIt<Type>()` or `getIt<Type>(param1: value)` for parameterized cubits

### Routing
- Route constants: `lib/core/routes/my_routes.dart`
- Router: `lib/core/routes/my_router.dart` — wraps screens with `BlocProvider`/`MultiBlocProvider` in `generateRoute`
- Route arguments passed via `settings.arguments` (typically cast to `String`)
- Initial route determined by Supabase auth session in `main.dart`

### Localization
- ARB files in `lib/l10n/` (app_en.arb, app_ar.arb)
- Configuration in `l10n.yaml`, generated output: `AppLocalizations`
- Access strings via `AppLocalizations.of(context)!.stringKey`
- RTL support: `LocaleCubit` + `LocaleHelper.getTextDirection()` applied in `main.dart` builder

### Error Handling
- `ErrorHandler.handle()` in `lib/core/netowoks/supabase_error_handler.dart` converts `AuthException` and `PostgrestException` into `ApiErrorModel`
- `ApiResult<T>` (freezed union) wraps all repo returns as `.success(data)` or `.failure(error)`
- Note: the directory is spelled `netowoks` (typo preserved for consistency)

### Core Utilities
- `lib/core/widgets/`: Reusable widgets (MyButton, MyTextFormField, etc.)
- `lib/core/theme/`: Colors, text styles, theme config — follows system dark/light mode
- `lib/core/helpers/`: `ValidatorHelper` for form validation, `SharedPrefHelper`, `LocaleHelper`
- `lib/core/cache/`: SharedPreferences key constants

## Key Conventions

- Font: IBMPlexSansArabic (Arabic-first design)
- Screen sizing: flutter_screenutil with 375x812 design size
- Form controllers and formKey are defined in Cubit, not in UI
- When adding a new feature: create the feature folder structure, register services/repo/cubit in `injection.dart`, add route in `my_routes.dart` and `my_router.dart`, add localization strings in both ARB files then run `flutter gen-l10n`
