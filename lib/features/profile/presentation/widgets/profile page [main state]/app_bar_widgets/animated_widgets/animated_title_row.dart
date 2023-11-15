import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../injection_container.dart';
import '../../../../bloc/profile_bloc.dart';
import '../social_media_links_collapsed.dart';

class AnimatedTitleRow extends StatefulWidget {
  const AnimatedTitleRow({super.key});

  @override
  State<AnimatedTitleRow> createState() => _AnimatedTitleRowState();
}

class _AnimatedTitleRowState extends State<AnimatedTitleRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      upperBound: 60, // context.screenSize.width,
    );

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _animationController.duration!,
      child: Container(
        height: _animationController.value,
        width: context.screenSize.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F1).withOpacity(0.0),
        ),
        child: SizedBox(
          width: context.screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * User name
                BlocBuilder<ProfileBloc, ProfileState>(
                  bloc: sl<ProfileBloc>(),
                  builder: (context, state) {
                    state as ProfileLoadedSuccessState;
                    return Expanded(
                      child: Text(
                        state.data.name ?? "",
                        style:
                            context.textHeme.titleLarge!.copyWith(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
                // * Social Media
                const SocialMediaLinksCollapsed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
