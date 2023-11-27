import 'package:alalmiya_g3/views/home/pages/home/components/category_items.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final CategoryModel model;

  const Item({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 25),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(15),
            child: Image.network(model.image),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xffDD8560), width: 1)),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff676767)),
          )
        ],
      ),
    );
  }
}
