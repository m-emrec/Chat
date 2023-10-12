import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';

class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.context,
    required this.label,
    required this.color,
  });

  final BuildContext context;
  final String label;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //! Spacing
        8.pw,
        //! label
        Text(
          label,
          style: context.textHeme.labelSmall!.copyWith(
            color: color.shade800,
          ),
        ),
        //! Spacing
        8.pw,
        // ! indicator
        CircleAvatar(
          radius: 4,
          backgroundColor: color,
        )
      ],
    );
  }
}
