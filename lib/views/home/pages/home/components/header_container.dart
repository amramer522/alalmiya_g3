import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      padding: EdgeInsetsDirectional.only(start: 28, end: 28, top: 17, bottom: 16),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "New Collection",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Disscount 50% for the first transaction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA1A8B0),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text("Shop Now"),
                    style: FilledButton.styleFrom(backgroundColor: Color(0xffDD8560), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 43,
          ),
          Expanded(
              child: Image.network(
                "https://enghub.pro/storage/Lesson%20Pics/Talking%20About%20Outfits/1.png",
                height: 104,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}
