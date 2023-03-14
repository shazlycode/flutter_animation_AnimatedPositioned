import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/components.dart';
import 'package:flutter_animation/second_screen.dart';

enum How { show, hide }

class HomeSceen extends StatefulWidget {
  @override
  _HomeSceenState createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  bool show = false;

  How how;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Hero(
                  tag: "hero",
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    child: Text("Start Animations"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SecondScreen();
                      }));
                    }),
              ),
              Container(
                child: SizedBox(width: 250.0, child: colorizedAnimation),
              ),
              Text(
                "How Are You",
                style: ktxtSyle.copyWith(
                    fontWeight: FontWeight.w900, backgroundColor: Colors.blue),
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 90,
                      width: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "Hello",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      bottom: how == How.show ? 100 : 0,
                      curve: Curves.easeInOutCirc,
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.blue,
                        ),
                      ),
                      duration: Duration(seconds: 1))
                ],
              ),
              ElevatedButton(
                  child: Text("Show"),
                  onPressed: () {
                    setState(() {
                      how = How.show;
                    });
                  }),
              ElevatedButton(
                  child: Text("Hide"),
                  onPressed: () {
                    setState(() {
                      how = How.hide;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
