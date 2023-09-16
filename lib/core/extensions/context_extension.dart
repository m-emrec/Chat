import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textHeme => Theme.of(this).textTheme;

  /// MediaQuery
  Size get screenSize => MediaQuery.of(this).size;
}
