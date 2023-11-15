import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../injection_container.dart';
import '../../../../../../logger.dart';
import '../../../../../auth/data/models/user_model.dart';
import '../../../bloc/profile_bloc.dart';

class EmailFieldEditPage extends StatefulWidget {
  const EmailFieldEditPage({
    super.key,
  });

  @override
  State<EmailFieldEditPage> createState() => _EmailFieldEditPageState();
}

class _EmailFieldEditPageState extends State<EmailFieldEditPage> {
  late ProfileBloc _profileBloc;
  late ProfileUpdateState state;
  late UserModel userData;
  late String _initialData;
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //! define [ProfileBloc]
    _profileBloc = sl<ProfileBloc>();

    // ! get user name from the state
    state = _profileBloc.state as ProfileUpdateState;

    userData = state.data;

    //! set the text value of controllers
    _initialData = userData.email ?? "???";
    _emailController.text = _initialData;

    super.initState();
  }

  onEmailFieldSubmitted(String newVal) {
    if (newVal != _initialData) {
      _profileBloc.add(ProfileUpdateEmailEvent(newVal));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: context.textHeme.labelLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: TextField(
            focusNode: _focusNode,
            onTapOutside: (event) => _focusNode.unfocus(),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onSubmitted: (newVal) => onEmailFieldSubmitted(newVal),
          ),
        ),
      ],
    );
  }
}
