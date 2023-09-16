import 'package:chat_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class CustomButton extends ElevatedButton {
  const CustomButton({
    super.key,
    required super.onPressed,
    required super.child,
  });
  @override
  ButtonStyle? get style => const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.button),
      foregroundColor: MaterialStatePropertyAll(AppColors.buttonText),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ));
}


//  class a implements ElevatedButton {
//   a ({
//     super.key,
//     required super.onPressed,
//     required super.child,
//   });

//   @override
//   // TODO: implement autofocus
//   bool get autofocus => throw UnimplementedError();

//   @override
//   // TODO: implement child
//   Widget? get child => throw UnimplementedError();

//   @override
//   // TODO: implement clipBehavior
//   Clip get clipBehavior => throw UnimplementedError();

//   @override
//   StatefulElement createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }

//   @override
//   State<ButtonStyleButton> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

//   @override
//   List<DiagnosticsNode> debugDescribeChildren() {
//     // TODO: implement debugDescribeChildren
//     throw UnimplementedError();
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     // TODO: implement debugFillProperties
//   }

//   @override
//   ButtonStyle defaultStyleOf(BuildContext context) {
//     // TODO: implement defaultStyleOf
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement enabled
//   bool get enabled => throw UnimplementedError();

//   @override
//   // TODO: implement focusNode
//   FocusNode? get focusNode => throw UnimplementedError();

//   @override
//   // TODO: implement key
//   Key? get key => throw UnimplementedError();

//   @override
//   // TODO: implement onFocusChange
//   ValueChanged<bool>? get onFocusChange => throw UnimplementedError();

//   @override
//   // TODO: implement onHover
//   ValueChanged<bool>? get onHover => throw UnimplementedError();

//   @override
//   // TODO: implement onLongPress
//   VoidCallback? get onLongPress => throw UnimplementedError();

//   @override
//   // TODO: implement onPressed
//   VoidCallback? get onPressed => throw UnimplementedError();

//   @override
//   // TODO: implement statesController
//   MaterialStatesController? get statesController => throw UnimplementedError();

//   @override
//   // TODO: implement style
//   ButtonStyle? get style => throw UnimplementedError();

//   @override
//   ButtonStyle? themeStyleOf(BuildContext context) {
//     // TODO: implement themeStyleOf
//     throw UnimplementedError();
//   }

//   @override
//   DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
//     // TODO: implement toDiagnosticsNode
//     throw UnimplementedError();
//   }

//   @override
//   String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     // TODO: implement toStringDeep
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     // TODO: implement toStringShallow
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShort() {
//     // TODO: implement toStringShort
//     throw UnimplementedError();
//   }
// }
