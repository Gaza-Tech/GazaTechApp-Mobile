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

### Data Flow
`UI (Screen) → Cubit → Repository → ApiService → Supabase`

- **ApiService**: Direct Supabase client calls
- **Repository**: Wraps ApiService, returns `ApiResult<T>` (success/failure)
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

### Dependency Injection
- Uses `get_it` package
- All registrations in `lib/core/di/injection.dart`
- Pattern: Register ApiService → Repository → Cubit (factory for Cubits)
- Access via `getIt<Type>()` or `getIt<Type>(param1: value)` for parameterized cubits

### Routing
- Route definitions: `lib/core/routes/my_routes.dart`
- Router implementation: `lib/core/routes/my_router.dart`
- Cubits are provided via BlocProvider in router's generateRoute method

### Localization
- ARB files in `lib/l10n/` (app_en.arb, app_ar.arb)
- Configuration in `l10n.yaml`
- Access strings via `AppLocalizations.of(context)!.stringKey`
- RTL support built-in with LocaleCubit

### Core Utilities
- `lib/core/netowoks/`: Supabase config, error handling, ApiResult
- `lib/core/widgets/`: Reusable widgets (MyButton, MyTextFormField, etc.)
- `lib/core/theme/`: Colors, text styles, theme configuration
- `lib/core/helpers/`: Validators, SharedPreferences helper, locale helper

## Key Conventions

- Font: IBMPlexSansArabic (Arabic-first design)
- Screen sizing: flutter_screenutil with 375x812 design size
- Error handling: All API errors go through `ErrorHandler.handle()` returning `ApiErrorModel`
- Form controllers and formKey are defined in Cubit, not in UI
