import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      padding: const EdgeInsetsDirectional.only(start: 28, end: 28, top: 17, bottom: 16),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  "New Collection",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Disscount 50% for the first transaction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA1A8B0),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xffDD8560), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: const Text("Shop Now"),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
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
