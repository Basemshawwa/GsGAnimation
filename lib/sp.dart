import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplachAnimationScrenn extends StatefulWidget {
  @override
  _SplachAnimationScrennState createState() => _SplachAnimationScrennState();
}

class _SplachAnimationScrennState extends State<SplachAnimationScrenn>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    // final curvedAnimation = CurvedAnimation(
    //   parent: animationController,
    //   curve: Curves.bounceIn,
    //   reverseCurve: Curves.easeOut,
    // );

    animation = Tween<double>(
      end: 2 * math.pi,
      begin: 0,
    )
        .chain(CurveTween(
          curve: Curves.bounceIn,
        ))
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            }
            // else if (status == AnimationStatus.dismissed) {
            //   animationController.forward();
            // }
          });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            child: Image.asset(
              'assets/images/Group 29.png',
              height: 150,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
