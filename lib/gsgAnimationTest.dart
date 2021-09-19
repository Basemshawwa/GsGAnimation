import 'package:flutter/material.dart';
import 'dart:math' as math;

class GsGScreen extends StatefulWidget {
  @override
  _GsGScreenState createState() => _GsGScreenState();
}

class _GsGScreenState extends State<GsGScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Center(
          child: Container(
            child: Image.asset('assets/images/Group 29.png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
