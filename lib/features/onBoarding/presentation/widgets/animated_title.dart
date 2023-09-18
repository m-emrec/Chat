// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedFrame extends StatefulWidget {
  final Widget secondChild;
  const AnimatedFrame({
    Key? key,
    required this.secondChild,
  }) : super(key: key);

  @override
  State<AnimatedFrame> createState() => _AnimatedFrameState();
}

class _AnimatedFrameState extends State<AnimatedFrame> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(),
      secondChild: widget.secondChild,
      crossFadeState: _crossFadeState,
      duration: const Duration(
        milliseconds: 750,
      ),
    );
  }
}
