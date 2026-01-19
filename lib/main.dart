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

class MyApp extends StatelessWidget {
  final MyRouter myRouter;
  const MyApp({super.key, required this.myRouter});

  @override
  Widget build(BuildContext context) {
    // Check if user is already logged in
    final session = Supabase.instance.client.auth.currentSession;
    final initialRoute = session != null ? MyRoutes.home : MyRoutes.signIn;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gaza Tech',
          theme: MyTheme.darkTheme,
          onGenerateRoute: myRouter.generateRoute,
          initialRoute: initialRoute,
        );
      },
    );
  }
}
