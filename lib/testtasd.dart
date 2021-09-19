import 'package:flutter/material.dart';

class testdd extends StatefulWidget {
  @override
  _testddState createState() => _testddState();
}

class _testddState extends State<testdd> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 0.08),
    ).animate(animationController);
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
}
