import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/features/profile/presentation/widgets/user_profile_body_widgets/status_widget.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: context.screenSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///! Status
              StatusWidget(
                controller: _statusController,
              ),
              16.ph,
              //! email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: context.textHeme.labelLarge,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 16.0),
                    child: SelectableText("m.emrec45@gmail.com"),
                  ),
                ],
              ),

              //! Change password buttton [TextButton]
              // ButtonText(
              //   onTap: () {},
              //   text: "Change Password",
              //   size: 0.4,
              // ),

              16.ph,

              //!  phone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone",
                    style: context.textHeme.labelLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 16.0),
                    child: SelectableText(
                      "5550286812",
                      contextMenuBuilder: (context, editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          children: [
                            Text("data"),
                          ],
                          anchors: TextSelectionToolbarAnchors.fromSelection(
                            endGlyphHeight: 1,
                            startGlyphHeight: 0,
                            selectionEndpoints: [],
                            renderBox: RenderTapRegion(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              16.ph,
              //! birthday
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birthday",
                    style: context.textHeme.labelLarge,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Text("29.06.1999"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
