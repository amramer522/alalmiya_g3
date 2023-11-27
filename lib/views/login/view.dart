import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/home/view.dart';
import 'package:alalmiya_g3/views/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design/app_input.dart';
import '../../core/design/my_app_bar.dart';
import '../../core/design/social_button.dart';
import '../forget_password/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: "Login", withBack: false),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          children: [
            Center(
                child: Text(
              "Hi Welcome back, you’ve been missed",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
            SizedBox(height: 39),
            AppInput(
              prefixIcon: "email.png",
              controller: emailController,
              labelText: "Enter your email",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email Must Be Not Empty";
                } else {
                  return null;
                }
              },
            ),
            AppInput(
              prefixIcon: "password.png",
              controller: passwordController,
              labelText: "Enter your password",
              isPassword: true,
              bottomSpace: 0,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password Must Be Not Empty";
                } else if (value.length < 7) {
                  return "Password is Weak";
                } else {
                  return null;
                }
              },
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                  onPressed: () {
                    navigateTo(ForgetPasswordView());
                  },
                  child: Text("Forgot Password?")),
            ),
            //amramer522@gmail.com
            SizedBox(height: 17),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print(emailController.text);
                  print(passwordController.text);
                  navigateTo(HomeView(), keepHistory: false);
                }
              },
              child: Text("Login"),
            ),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      navigateTo(RegisterView());
                    },
                    child: Text("Sign Up"))
              ],
            ),
            SizedBox(height: 17),
            Row(
              children: [
                Expanded(child: Divider()),
                SizedBox(
                  width: 10,
                ),
                Text("OR"),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 30),
            SocialButton(
              image: "assets/icons/google.png",
              text: "Sign in with google",
              onTap: () {
                print("Sign in with google");
              },
            ),
            SocialButton(
              text: "Sign in with Apple",
              image: "assets/icons/apple.png",
              onTap: () {
                print("Sign in with Apple");
              },
            ),
            SocialButton(
              image: "assets/icons/facebook.png",
              text: "Sign in with Facebook",
              onTap: () {
                print("Sign in with Facebook");
              },
            ),
          ],
        ),
      ),
    );
  }
}
