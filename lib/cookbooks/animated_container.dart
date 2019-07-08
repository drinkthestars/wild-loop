import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trying_out_flutter/main.dart';

class AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Default values of stateful attributes
  double _width = 10;
  double _height = 10;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(4);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animated Container!")),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
                color: _color, borderRadius: _borderRadiusGeometry),
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);

            _borderRadiusGeometry =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        }),
      ),
    );
  }
}
