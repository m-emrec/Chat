import 'dart:ui';

import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/app_bar_widgets/animated_widgets/animated_title_row.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({super.key});

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: const AnimatedTitleRow(),
        ),
      ),
    );
  }
}
