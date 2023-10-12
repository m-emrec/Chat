import 'package:flutter/material.dart';

class AppTheme {
  ///
  ///
  static ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffold,

    ///* TextTheme
    textTheme: TextStyles.textTheme,

    ///// Widget Themes
    ///*App bar theme
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.textTheme.titleLarge,
      centerTitle: true,
      color: AppColors.scaffold,
      elevation: 0,
    ),

    ///*Card Theme
    cardTheme: const CardTheme(
      color: AppColors.cardColor,
    ),

    ///* Icon Theme
    iconTheme: const IconThemeData(),
  );

  ////                                                d
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}

class TextStyles {
  static TextTheme textTheme = const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF153243),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      color: Color(0xFF153243),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      color: Color(0xFF153243),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}

class AppColors {
  static const Color cardColor = Color(0xFFFBF3EF);
  static const Color scaffold = Color(0xFFFEFEFA);
  static const Color button = Color(0xFF153243);
  static const Color buttonText = Color(0xFFEFF6FA);
}
