import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design/app_input.dart';
import '../../core/design/my_app_bar.dart';
import '../../dialogs/success.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "Create New Password",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xff101623)),
          ),
          SizedBox(
            height: 11,
          ),
          const Text(
            "Create your new password to login",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffA1A8B0)),
          ),
          SizedBox(
            height: 24,
          ),
          AppInput(
            prefixIcon: "password.png",
            labelText: "Enter your password",
            isPassword: true,
          ),
          AppInput(
            prefixIcon: "password.png",
            labelText: "Enter Confirm Password",
            isPassword: true,
          ),
          FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(),
                );
              },
              child: Text("Create Password")),
        ],
      ),
    );
  }
}
