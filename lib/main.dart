import 'package:chat_app/config/route/routes.dart';
import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
