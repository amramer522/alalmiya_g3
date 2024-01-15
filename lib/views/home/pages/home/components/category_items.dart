import 'package:flutter/material.dart';

import 'item.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


  List<CategoryModel> list =[
    CategoryModel(id: 0, image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=2970&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Pant"),
    CategoryModel(id: 1, image: "https://backgroundclean.com/images/uploads/pantolon.jpg", title: "Shirt"),
    CategoryModel(id: 2, image: "https://main-cdn.sbermegamarket.ru/hlr-system/-1/10/55/23/31/36/5/100026666378b0.jpg", title: "Men\nShoes"),
    CategoryModel(id: 3, image: "https://www.jackpykeshop.co.uk/images/detailed/7/moleskin_trousers.jpg", title: "Women\nShoes"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: const [
          Text(
            "Categary",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Text(
            "See All",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xff4E6542)),
          ),
        ],
      ),
      const SizedBox(
        height: 18,
      ),
      SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Item(
            model: list[index],
          ),
          itemCount: list.length,
        ),
      ),
    ],);
  }
}

class CategoryModel
{
  int id;
  String image,title;

  CategoryModel({required this.id,required this.image,required this.title});
}
