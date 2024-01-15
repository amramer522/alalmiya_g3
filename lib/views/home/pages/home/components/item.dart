import 'package:alalmiya_g3/views/home/pages/home/components/category_items.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final CategoryModel model;

  const Item({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 25),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xffDD8560), width: 1)),
            child: Image.network(model.image),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff676767)),
          )
        ],
      ),
    );
  }
}
