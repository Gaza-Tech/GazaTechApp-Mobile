import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gaza_tech/core/di/injection.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/core/localization/locale_state.dart';
import 'package:gaza_tech/core/helpers/locale_helper.dart';
import 'package:gaza_tech/core/netowoks/supabase_config.dart';
import 'package:gaza_tech/core/routes/my_router.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/my_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize Supabase
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  // Setup Dependency Injection
  await setupGetIt();

  // Set the system UI mode to edge-to-edge,
  // making the navigation bar and status bar transparent
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );

  runApp(MyApp(myRouter: MyRouter()));
}

class MyApp extends StatefulWidget {
  final MyRouter myRouter;
  const MyApp({super.key, required this.myRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        final email = data.session?.user.email ?? '';
        if (email.isNotEmpty) {
          // Check if the account is banned/deactivated before navigating
          final status = await Supabase.instance.client.rpc(
            'check_email_availability',
            params: {'email_input': email},
          );
          if (status == 'banned') {
            await Supabase.instance.client.auth.signOut();
            return;
          }
        }
        // Navigate to home when signed in via OAuth
        _navigatorKey.currentState?.pushNamedAndRemoveUntil(
          MyRoutes.home,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if user is already logged in
    final session = Supabase.instance.client.auth.currentSession;
    final initialRoute = session != null ? MyRoutes.home : MyRoutes.signIn;

    return BlocProvider(
      create: (_) => getIt<LocaleCubit>(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, localeState) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Gaza Tech App',

                // Localization Configuration
                locale: localeState.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                // Theme Configuration - follows system theme
                themeMode: ThemeMode.system,
                theme: MyThemes.getTheme(
                  brightness: Brightness.light,
                  locale: localeState.locale,
                ),
                darkTheme: MyThemes.getTheme(
                  brightness: Brightness.dark,
                  locale: localeState.locale,
                ),
                onGenerateRoute: widget.myRouter.generateRoute,
                initialRoute: initialRoute,

                // RTL support via builder
                builder: (context, child) {
                  return Directionality(
                    textDirection: LocaleHelper.getTextDirection(
                      localeState.locale,
                    ),
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
