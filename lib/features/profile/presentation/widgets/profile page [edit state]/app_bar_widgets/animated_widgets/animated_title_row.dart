import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:chat_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../social_media_links_collapsed.dart';

class AnimatedTitleRowEdit extends StatefulWidget {
  final Size screenSize;
  const AnimatedTitleRowEdit({super.key, required this.screenSize});

  @override
  State<AnimatedTitleRowEdit> createState() => _AnimatedTitleRowEditState();
}

class _AnimatedTitleRowEditState extends State<AnimatedTitleRowEdit>
    with SingleTickerProviderStateMixin {
  //! nameController
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  // ! late variables
  late AnimationController _animationController;
  late ProfileBloc _profileBloc;
  late Size size;
  late ProfileUpdateState state;
  late UserModel userData;
  late String _initialData;

  ///
  @override
  void initState() {
    size = widget.screenSize;

    //! define [ProfileBloc]
    _profileBloc = sl<ProfileBloc>();

    // ! get user name from the state
    state = _profileBloc.state as ProfileUpdateState;

    userData = state.data;

    //! set the text value of [_nameController]
    _initialData = userData.name!;
    _nameController.text = _initialData;

    // !define Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      upperBound: 60, // context.screenSize.width,
    );

    //! forward the animation
    _animationController.forward();

    /// add listener to [_animationController]
    /// and set the state to update the UI
    /// depending on the value of [_animationController].
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _animationController.duration!,
      child: Container(
        height: _animationController.value,
        width: size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F1).withOpacity(0.0),
        ),
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              bloc: _profileBloc,
              buildWhen: (previous, current) => current is ProfileUpdateState,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! User name
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        onTapOutside: (event) => _focusNode.unfocus(),
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        onSubmitted: (value) => onNameFieldSubmitted(value),
                      ),
                    ),

                    //! Social Media
                    const SocialMediaLinksCollapsed(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  onNameFieldSubmitted(newVal) {
    if (newVal != _initialData) {
      _profileBloc.add(ProfileUpdateDisplayNameEvent(newVal));
    }
  }
}
