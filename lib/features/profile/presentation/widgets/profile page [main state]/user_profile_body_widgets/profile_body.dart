import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/profile/presentation/widgets/profile%20page%20%5Bmain%20state%5D/user_profile_body_widgets/status_widget.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/profile_bloc.dart';

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
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: sl<ProfileBloc>(),
        builder: (context, state) {
          state as ProfileLoadedSuccessState;
          final data = state.data;

          return SizedBox(
            width: context.screenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///! Status
                  StatusWidget(
                    controller: _statusController..text = data.status ?? "",
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                        child: SelectableText(data.email ?? ""),
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
                        padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                        child: Text(
                          data.phoneNumber ?? "",
                        ),
                      ),
                    ],
                  ),
                  16.ph,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
