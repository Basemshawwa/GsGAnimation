import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationCared extends StatefulWidget {
  @override
  _AnimationCaredState createState() => _AnimationCaredState();
}

class _AnimationCaredState extends State<AnimationCared>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: animation,
        child: Container(
          child: Center(
            child: Image.asset('assets/images/Group 29.png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
