import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../injection_container.dart';
import '../../../../../../logger.dart';
import '../../../../../auth/data/models/user_model.dart';
import '../../../bloc/profile_bloc.dart';

class PhoneFieldEditPage extends StatefulWidget {
  const PhoneFieldEditPage({
    super.key,
  });

  @override
  State<PhoneFieldEditPage> createState() => _PhoneFieldEditPageState();
}

class _PhoneFieldEditPageState extends State<PhoneFieldEditPage> {
  // ! late variables
  late ProfileBloc _profileBloc;
  late ProfileUpdateState state;
  late UserModel userData;

  // ! TextEditingControllers
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    //! define [ProfileBloc]
    _profileBloc = sl<ProfileBloc>();

    // ! get user name from the state
    state = _profileBloc.state as ProfileUpdateState;

    userData = state.data;

    //! set the text value of controllers
    _phoneController.text = userData.phoneNumber ?? "???";
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void onPhoneFieldSubmitted(String newVal) {
    logger.i(newVal);
    _profileBloc.add(ProfileUpdatePhoneNumberEvent(newVal));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone",
          style: context.textHeme.labelLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: TextField(
            focusNode: _focusNode,
            onTapOutside: (event) => _focusNode.unfocus(),
            controller: _phoneController,
            onSubmitted: (value) => onPhoneFieldSubmitted(value),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
