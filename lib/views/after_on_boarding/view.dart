import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/home/view.dart';
import 'package:alalmiya_g3/views/login/view.dart';
import 'package:flutter/material.dart';

class AfterOnBoardingView extends StatelessWidget {
  const AfterOnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset("assets/images/after_on_boarding1.png"),
                Spacer(),
                Column(
                  children: [
                    Image.asset("assets/images/after_on_boarding2.png"),
                    SizedBox(
                      height: 23,
                    ),
                    Image.asset("assets/images/after_on_boarding3.png"),
                  ],
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 33,
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                children: [
                  TextSpan(text: "The"),
                  TextSpan(text: " Suits App ", style: TextStyle(color: Color(0xffDD8560))),
                  TextSpan(text: "that\nMakes Your Look Your Best"),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Everything you need in the world\nof fashion, old and new",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff727272)),
            ),
            SizedBox(
              height: 62,
            ),
            FilledButton(
              onPressed: () {
                navigateTo(LoginView());
              },
              child: Text("Get started"),
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xffDD8560),
                fixedSize: Size.fromHeight(56)
              ),
            )
          ],
        ),
      ),
    );
  }
}
