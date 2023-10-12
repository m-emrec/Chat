import 'dart:ui';

import 'package:flutter/material.dart';

import 'animated_widgets/animated_title_row.dart';

class AppBarTitleEdit extends StatefulWidget {
  const AppBarTitleEdit({super.key});

  @override
  State<AppBarTitleEdit> createState() => _AppBarTitleEditState();
}

class _AppBarTitleEditState extends State<AppBarTitleEdit> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: const AnimatedTitleRowEdit(),
          ),
        ),
      ),
    );
  }
}
