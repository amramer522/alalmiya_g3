import 'package:alalmiya_g3/core/design/my_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(text: "Payment"),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/circle_success.jpg",
              height: 130,
              width: 130,
            ),
            const SizedBox(
              height: 34,
            ),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Thank you for your purchase.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(onPressed: () {}, child: const Text("View Order")),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: const Text("View E-Receipt")),
            ],
          ),
        ),
      ),
    );
  }
}
