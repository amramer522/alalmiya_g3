import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<String> list = ["All", "Blazar", "Shirt", "Pant", "Shoes"];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      margin: EdgeInsetsDirectional.only(start: 11),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedItem = index;
            setState(() {});
            print("Hello");
            print(selectedItem);
          },
          child: Container(
            height: 29,
            padding: EdgeInsets.symmetric(horizontal: 17),
            margin: EdgeInsetsDirectional.only(end: 10),
            child: Center(
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: selectedItem == index ? Colors.white : Colors.black,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedItem == index ? Colors.red : Colors.white,
            ),
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}

