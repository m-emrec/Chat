import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_up_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  "/": (p0) => const HomePage(),
  SignInPage.routeName: (p0) => const SignInPage(),
  SignUpPage.routeName: (p0) => const SignUpPage(),
};
