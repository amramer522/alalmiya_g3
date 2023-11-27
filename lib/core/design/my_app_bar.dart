import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool withBack;

  const MyAppBar({Key? key, this.text = "", this.withBack=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:withBack? GestureDetector(
        child: SvgPicture.asset(
          "assets/icons/back.svg",
          height: 24,
          width: 24,
          fit: BoxFit.scaleDown,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ):null,
      title: Text(text),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
