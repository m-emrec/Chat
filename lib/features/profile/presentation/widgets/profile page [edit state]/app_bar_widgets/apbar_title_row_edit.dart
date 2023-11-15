import 'dart:ui';

import 'package:flutter/material.dart';

import 'animated_widgets/animated_title_row.dart';

class AppBarTitleEdit extends StatefulWidget {
  final Size screenSize;
  const AppBarTitleEdit({super.key, required this.screenSize});

  @override
  State<AppBarTitleEdit> createState() => _AppBarTitleEditState();
}

class _AppBarTitleEditState extends State<AppBarTitleEdit> {
  late Size _size;

  @override
  void initState() {
    _size = widget.screenSize;
    super.initState();
  }

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
          child: AnimatedTitleRowEdit(
            screenSize: _size,
          ),
        ),
      ),
    );
  }
}
