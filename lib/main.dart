import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gaza_tech/core/di/injection.dart';
import 'package:gaza_tech/core/netowoks/supabase_config.dart';
import 'package:gaza_tech/core/routes/my_router.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize Supabase
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  // Setup Dependency Injection
  await setupGetIt();

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
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
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

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Gaza Tech App',
          theme: MyTheme.lightTheme,
          onGenerateRoute: widget.myRouter.generateRoute,
          initialRoute: initialRoute,
        );
      },
    );
  }
}
