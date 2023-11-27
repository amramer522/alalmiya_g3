import 'dart:async';

import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/home/view.dart';
import 'package:alalmiya_g3/views/on_boarding/view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    print("Hello from initState");
    Timer(Duration(seconds: 3), () {
      navigateTo(OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Hello from build");

    return Scaffold(
      backgroundColor: Color(0xffDD8560),
      body: Center(
        child: Swing(
          duration: Duration(seconds: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 100,
              ),
              SizedBox(width: 15),
              Text(
                "suits",
                style: TextStyle(fontSize: 128, fontFamily: "Waterfall", color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
