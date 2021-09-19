import 'package:animation_test/gsgAnimationTest.dart';
import 'package:animation_test/sp.dart';
import 'package:animation_test/splash_screen.dart';
import 'package:animation_test/testerAnimat.dart';
import 'package:flutter/material.dart';

import 'animstation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GsGScreen(),
    );
  }
}
