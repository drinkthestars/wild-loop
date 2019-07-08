import 'dart:math';

import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  final String title;

  FadeTransitionPage({Key key, this.title}) : super(key: key);

  @override
  FadeTransitionState createState() => FadeTransitionState();
}

class FadeTransitionState extends State<FadeTransitionPage> {
  bool _visible = true;
  double _width = 10;
  double _height = 10;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(4);

  void _changeProperties() {
    final random = Random();

    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();

    _color = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

    _borderRadiusGeometry =
        BorderRadius.circular(random.nextInt(100).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadiusGeometry,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _visible = !_visible;

          if (_visible) _changeProperties();
        });
      }),
    );
  }
}
