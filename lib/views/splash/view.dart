import 'dart:async';

import 'package:alalmiya_g3/core/logic/cache_helper.dart';
import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/home/view.dart';
import 'package:alalmiya_g3/views/login/view.dart';
import 'package:alalmiya_g3/views/on_boarding/view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isFirstTime = CacheHelper.isFirstTime;
  bool isAuth = CacheHelper.isAuth;

  @override
  void initState() {
    super.initState();
    debugPrint("Hello from initState");
    Timer(const Duration(seconds: 3), () {
      if (isFirstTime) {
        navigateTo(const OnBoardingView());
      } else {
        if (isAuth) {
          navigateTo(const HomeView());
        } else {
          navigateTo(const LoginView());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Hello from build");

    return Scaffold(
      backgroundColor: const Color(0xffDD8560),
      body: Center(
        child: Swing(
          duration: const Duration(seconds: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 15),
              const Text(
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
