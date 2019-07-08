import 'package:flutter/material.dart';
import 'package:trying_out_flutter/cookbooks/animated_container.dart';
import 'package:trying_out_flutter/cookbooks/floating_action_button.dart';
import 'package:trying_out_flutter/cookbooks/fade_transition.dart';
import 'package:trying_out_flutter/random_words.dart';

void main() => runApp(FadeTransitionApp());

class RandomWordsApp extends StatelessWidget {
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

class MyFabSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAB Sample',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SampleAppPage(),
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  AnimatedContainerAppState createState() => AnimatedContainerAppState();
}

class FadeTransitionApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fade In/Out",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: FadeTransitionPage(
        title: "Fade In/Out - Animated Opacity",
      ),
    );
  }
}
