import 'package:flutter/material.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../logger.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
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
    return Positioned(
      right: 0,
      child: AnimatedScale(
        scale: _animationController.value,
        duration: _animationController.duration!,
        curve: Curves.elasticOut,
        child: Material(
          elevation: 2,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              logger.i("Log Out");
            },
            overlayColor: const MaterialStatePropertyAll(AppColors.button),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
            ),
            child: Container(
              width: 64,
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.scaffold.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                ),
              ),
              child: const SafeArea(
                child: Icon(
                  Icons.logout_outlined,
                  color: AppColors.button,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
