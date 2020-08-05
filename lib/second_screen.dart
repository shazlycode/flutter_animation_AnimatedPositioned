import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/components.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation colorAnimation;
  Animation colorAnimation2;
  AnimatedPositioned ani;
  double width;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 2,
    );
    controller.forward();
    ani = AnimatedPositioned(
      child: Container(
        child: Image.asset("images/logo.png"),
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
      duration: Duration(seconds: 5),
    );
    colorAnimation =
        ColorTween(begin: Colors.green, end: Colors.red).animate(controller);
    colorAnimation2 =
        ColorTween(begin: Colors.black, end: Colors.blue).animate(controller);

    colorAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          controller.reverse(from: 100);
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          controller.forward();
        });
      }
      print(status);
    });
    controller.addListener(() {
      setState(() {
        controller.value;
        print(controller.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Container(
                width: controller.value * 100,
                child: Center(
                  child: Hero(
                    tag: "hero",
                    child: Image.asset(
                      "images/logo.png",
                    ),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.school,
              size: 200,
              color: colorAnimation2.value,
            ),
            SizedBox(
              width: 250.0,
              child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Larry Page",
                    "Bill Gates",
                    "Steve Jobs",
                  ],
                  textStyle: ktxtSyle.copyWith(
                    fontWeight: FontWeight.w900,
                    backgroundColor: Colors.white,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            ani,
          ],
        ),
      ),
    );
  }
}
