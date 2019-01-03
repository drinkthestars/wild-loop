import 'package:flutter/material.dart';
import 'package:trying_out_flutter/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Username generator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: RandomWords(),
    );
  }
}
