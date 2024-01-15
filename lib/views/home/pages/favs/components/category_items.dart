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
      margin: const EdgeInsetsDirectional.only(start: 11),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedItem = index;
            setState(() {});
            debugPrint("Hello");
            debugPrint(selectedItem.toString());
          },
          child: Container(
            height: 29,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            margin: const EdgeInsetsDirectional.only(end: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedItem == index ? Colors.red : Colors.white,
            ),
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
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}

