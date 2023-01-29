import 'package:flutter/material.dart';

// routes
import 'routes/app_router.dart';

// app_themes
import 'package:my_app/src/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
      theme: AppThemes.themeLight,
    );
  }
}
