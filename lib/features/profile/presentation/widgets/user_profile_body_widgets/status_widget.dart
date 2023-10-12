import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/profile/presentation/widgets/user_profile_body_widgets/status_text.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  final TextEditingController controller;
  const StatusWidget({super.key, required this.controller});

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late TextEditingController _statusController;
  @override
  void initState() {
    _statusController = widget.controller..text = "online";
    super.initState();
  }

//TODO Get it from the Database
  Widget _status = const SizedBox();

  /// Manages status
  statusManager(String value) {
    setState(() {
      switch (value) {
        ///! online
        case "online":
          _status = StatusText(
            context: context,
            color: Colors.green,
            label: "Online",
          );
          break;

        ///! offline
        case "offline":
          _status = StatusText(
            context: context,
            color: Colors.red,
            label: "Offline",
          );
          break;

        ///! do not disturb
        case "do-not-disturb":
          _status = StatusText(
            context: context,
            color: Colors.purple,
            label: "Do not disturb",
          );
          break;
        default:
          _status = StatusText(
            context: context,
            color: Colors.green,
            label: "Online",
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: _statusController,
      width: context.screenSize.width - 32,

      onSelected: (value) => statusManager(value!),

      ///! title
      leadingIcon: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Status ",
              style: context.textHeme.labelLarge,
            ),

            ///! Status Text
            _status,
          ],
        ),
      ),

      ///! Trailing
      trailingIcon: const SizedBox(),

      ///! Decoration
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),

      ///*!Items
      dropdownMenuEntries: [
        /// Online
        DropdownMenuEntry(
          leadingIcon: const CircleAvatar(
            radius: 4,
            backgroundColor: Colors.green,
          ),
          value: "online",
          label: "Online",
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              context.textHeme.labelSmall,
            ),
            foregroundColor: MaterialStatePropertyAll(Colors.green.shade800),
          ),
        ),

        ///! offline
        DropdownMenuEntry(
          leadingIcon: const CircleAvatar(
            radius: 4,
            backgroundColor: Colors.red,
          ),
          value: "offline",
          label: "Offline",
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              context.textHeme.labelSmall,
            ),
            foregroundColor: MaterialStatePropertyAll(Colors.red.shade800),
          ),
        ),

        ///! Do not disturb
        DropdownMenuEntry(
          leadingIcon: const CircleAvatar(
            radius: 4,
            backgroundColor: Colors.purple,
          ),
          value: "do-not-disturb",
          label: "Do not disturb",
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              context.textHeme.labelSmall,
            ),
            foregroundColor: MaterialStatePropertyAll(Colors.purple.shade800),
          ),
        ),
      ],
    );
  }
}
