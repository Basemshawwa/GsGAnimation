import 'dart:async';

import 'package:animation_test/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;
  startTimer() async {
    var _duration = Duration(seconds: 8);
    return Timer(_duration, navigateToLogin);
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 3,
        ));
    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeInCubic);
    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.forward) {
              animController.forward();
            }
          });
    animController.forward();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
          angle: animation.value,
          child: Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.warning),
              radius: 90,
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/foodkodeliveryapp.appspot.com/o/93372915_3208675869163420_1776564980917731328_o.jpg?alt=media&token=71e1237a-bcff-4030-ac3d-d1eb27b82636'),
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animController.dispose();
    super.dispose();
  }
}
