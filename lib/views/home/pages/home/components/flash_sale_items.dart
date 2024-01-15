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
        const Text(
          "Flash Sale",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 29,
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
                    flashSales[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: selectedItem == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: flashSales.length,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

