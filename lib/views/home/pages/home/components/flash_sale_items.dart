import 'package:flutter/material.dart';

class FlashSaleItems extends StatefulWidget {
  const FlashSaleItems({Key? key}) : super(key: key);

  @override
  State<FlashSaleItems> createState() => _FlashSaleItemsState();
}

class _FlashSaleItemsState extends State<FlashSaleItems> {
  List<String> flashSales = ["All", "Newest", "Popular", "Men", "Women"];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Flash Sale",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 29,
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
                    flashSales[index],
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
            itemCount: flashSales.length,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

