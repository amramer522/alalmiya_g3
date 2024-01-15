import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/create_new_password/view.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/design/my_app_bar.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Enter Verification Code",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xff101623)),
          ),
          const SizedBox(
            height: 11,
          ),
          const Text.rich(TextSpan(style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffA1A8B0)), children: [
            TextSpan(text: "Enter code that we have sent to your number"),
            TextSpan(text: " 08528188*** ", style: TextStyle(color: Color(0xff101623))),
          ])),
          const SizedBox(
            height: 32,
          ),
          PinCodeTextField(
            appContext: context,
            length: 4,
            backgroundColor: Colors.transparent,
            cursorColor: Theme.of(context).primaryColor,
            enableActiveFill: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              selectedFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              activeFillColor: Colors.white,
              borderRadius: BorderRadius.circular(16),
              fieldHeight: 64,
              fieldWidth: 64,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.white,
              selectedColor: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          FilledButton(onPressed: () {
            navigateTo(const CreateNewPasswordView(),);
          }, child: const Text("Verify")),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Didn’t receive the code?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              TextButton(onPressed: () {}, child: const Text("Resend"))
            ],
          ),
        ],
      ),
    );
  }
}
