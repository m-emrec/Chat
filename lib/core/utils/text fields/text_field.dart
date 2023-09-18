// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
import 'package:flutter/material.dart';

import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';

abstract class CustomTextField extends TextFormField {
  final String? hintText;
  final Widget? label;
  final String? labelText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  CustomTextField({
    super.key,
    this.hintText,
    this.label,
    this.labelText,
    this.textInputType,
    this.textInputAction,
    super.controller,
    super.validator,
  });

  @override
  FormFieldBuilder<String> get builder => (_) {
        assert(
            label != null && labelText == null ||
                label == null && labelText != null ||
                label == null && labelText == null,
            "You can't set label and labelText together.\nOne of them must be null");
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label ?? const SizedBox(),
            labelText == null
                ? const SizedBox()
                : Text(
                    labelText ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.button,
                    ),
                  ),
            4.ph,
            TextFormField(
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.button,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black87,
                ),
                alignLabelWithHint: false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.start,
              ),
              keyboardType: textInputType,
              textInputAction: textInputAction,
            ),
          ],
        );
      };
}





// // ignore: camel_case_types
//  class a implements TextFormField {
//   @override
//   AutovalidateMode get autovalidateMode => throw UnimplementedError();

//   @override
//   FormFieldBuilder<String> get builder => throw UnimplementedError();

//   @override
//   TextEditingController? get controller => throw UnimplementedError();

//   @override
//   StatefulElement createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }

//   @override
//   FormFieldState<String> createState() {
//     throw UnimplementedError();
//   }

//   @override
//   List<DiagnosticsNode> debugDescribeChildren() {
//     throw UnimplementedError();
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   }

//   @override
//   bool get enabled => throw UnimplementedError();

//   @override
//   String? get initialValue => throw UnimplementedError();

//   @override
//   Key? get key => throw UnimplementedError();

//   @override
//   FormFieldSetter<String>? get onSaved => throw UnimplementedError();

//   @override
//   String? get restorationId => throw UnimplementedError();

//   @override
//   DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
//     throw UnimplementedError();
//   }

//   @override
//   String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShort() {
//     throw UnimplementedError();
//   }

//   @override
//   FormFieldValidator<String>? get validator => throw UnimplementedError();
// }
