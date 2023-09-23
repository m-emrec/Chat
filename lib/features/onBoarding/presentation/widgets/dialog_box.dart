// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/features/onBoarding/presentation/bloc/onboarding_bloc.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';

class DialogBox extends StatefulWidget {
  final String phone;
  final String vericificationId;
  const DialogBox({
    Key? key,
    required this.phone,
    required this.vericificationId,
  }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  late List<TextField> _textFieldList;
  int _index = 0;
  late OnboardingBloc _onboardingBloc;
  @override
  void initState() {
    _onboardingBloc = sl<OnboardingBloc>();

    _textFieldList = [];
    for (var i = 0; i < 6; i++) {
      _textFieldList.add(
        _textField(FocusNode()),
      );
    }
    super.initState();
  }

  TextField _textField(FocusNode node) => TextField(
        focusNode: node,
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          counter: SizedBox(),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (value) {
          /// if [_index] is less than 5 and text field is not emtpty
          /// increase the _index and call [nextFocus]
          if (value.isNotEmpty && _index < 5) {
            _index++;
            node.nextFocus();
          }

          /// if [_index] is greater than 0 and text field is  emtpty
          /// decrease the _index and call [previousFocus]
          if (value.isEmpty && _index > 0) {
            _index--;
            node.previousFocus();
          }
        },
      );
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_textFieldList[0].focusNode);

    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),

      /// title
      title: const Text("Enter Verification Code"),
      actionsAlignment: MainAxisAlignment.center,

      /// Actions
      actions: [
        ButtonText(
          onTap: () => Navigator.of(context).pop(),
          text: "Cancel",
          size: 0.4,
          height: 40,
        ),
        ResponsiveButton(
          onPressed: () async {
            String _code = "";
            for (var element in _textFieldList) {
              _code += element.controller!.text;
              logger.i(_code);
            }

            _onboardingBloc.add(
              CheckVerificationCodeEvent(
                  _code, widget.phone, widget.vericificationId),
            );
          },
          context: context,
          size: 0.4,
          child: const Text("Done"),
        )
      ],

      /// Content
      content: AspectRatio(
        aspectRatio: 16 / 3,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 3,
            maxCrossAxisExtent: 64,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 48,
              width: 48,
              child: Card(
                child: _textFieldList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
