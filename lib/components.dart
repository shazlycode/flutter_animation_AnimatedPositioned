import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const colorizedAnimation = ColorizeAnimatedTextKit(
    text: [
      "Larry Page",
      "Bill Gates",
      "Steve Jobs",
    ],
    textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
    colors: [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ],
    textAlign: TextAlign.start,
    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
    );

const ktxtSyle = TextStyle(fontSize: 40);
