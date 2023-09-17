import 'package:chat_app/config/route/routes.dart';
import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      // themeMode: ,
      darkTheme: AppTheme.darkTheme,
      initialRoute: SignInPage.routeName,
      routes: appRoutes,
    );
  }
}
