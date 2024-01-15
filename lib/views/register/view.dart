import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/app_info/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/design/app_input.dart';
import '../../core/design/my_app_bar.dart';
import '../../dialogs/success.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(text: "Sign Up"),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          children: [
            const AppInput(
              prefixIcon: "user_name.png",
              labelText: "Enter your name",
            ),
            const AppInput(
              prefixIcon: "email.png",
              labelText: "Enter your email",
            ),
            const AppInput(
              prefixIcon: "password.png",
              labelText: "Enter your password",
              isPassword: true,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: isSelected,
                    visualDensity: VisualDensity.compact,
                    side: const BorderSide(color: Color(0xffD9D9D9)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    onChanged: (value) {
                      debugPrint(value.toString());
                      isSelected = value!;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Expanded(
                  child: Text.rich(TextSpan(
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.82,
                      ),
                      children: [
                        const TextSpan(text: "I agree to the medidoc "),
                        TextSpan(
                          text: "Terms of Service",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateTo(const AppInfoView(title: "Terms of Service"));
                            },
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateTo(const AppInfoView(title: "Privacy Policy"));
                            },
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ])),
                )
              ],
            ),
            const SizedBox(height: 42),
            FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const SuccessDialog(),
                  );
                },
                child: const Text("Sign UP")),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have an account?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Sign In"))
              ],
            ),
          ],
        ));
  }
}
