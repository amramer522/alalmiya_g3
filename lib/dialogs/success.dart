import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/logic/helper_methods.dart';
import '../views/login/view.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 58,horizontal: 4),
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xffF5F8FF),
          child: SvgPicture.asset("assets/icons/success.svg"),
        ),
        const SizedBox(height: 25,),
        const Center(
          child: Text(
            "Success",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 7,),
        const Center(
          child: Text(
            "Your account has been successfully registered",
            textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 21,),
        Center(
          child: SizedBox(
            width: 183,
            child: FilledButton(
              onPressed: () {
                navigateTo(const LoginView(),keepHistory: false);
              },
              child: const Text("Login"),
            ),
          ),
        )
      ],
    );
  }
}
