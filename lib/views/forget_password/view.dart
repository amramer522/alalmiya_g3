import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';

import '../../core/design/app_input.dart';
import '../../core/design/my_app_bar.dart';
import '../otp/view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Forgot Your Password?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xff101623)),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Enter your email or your phone number, we will send you confirmation code",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffA1A8B0)),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xffE5E7EB)),
              ),
              child: TabBar(
                unselectedLabelColor: const Color(0xffA1A8B0),
                labelColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(29), color: const Color(0xffF9FAFB)),
                labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(text: "Email"),
                  Tab(text: "Phone"),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      AppInput(
                        prefixIcon: "email.png",
                        labelText: "Enter your email",
                      ),
                      FilledButton(onPressed: () {
                        navigateTo(OTPView());
                      }, child: Text("Reset Password")),
                    ],
                  ),
                  ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      AppInput(
                        prefixIcon: "phone.png",
                        labelText: "Enter your phone",
                      ),
                      FilledButton(onPressed: () {
                        navigateTo(OTPView());

                      }, child: Text("Reset Password")),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
