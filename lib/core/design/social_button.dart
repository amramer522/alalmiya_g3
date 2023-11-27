import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image,text;
  final VoidCallback? onTap;
  const SocialButton({Key? key, required this.image, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Color(0xffE5E7EB))
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 20,
                width: 20,
                fit: BoxFit.scaleDown,
              ),
              Spacer(),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
