import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/product_details/view.dart';
import 'package:flutter/material.dart';

import 'components/category_items.dart';
import 'components/flash_sale_items.dart';
import 'components/header_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://suitshop.com/static/293859623009445dda723d7a6b1bcd1f/41ad3/spotlight-collection-mens-2.jpg",
    "https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/suits/default/Winter/P6733_1.jpg",
    "https://image.mooresclothing.ca/is/image/Moores/37DX_01_AWEARNESS_BY_KENNETH_COLE_SUIT_SEPARATE_JACKETS_BLACK_SOLID_MAIN?imPolicy=pdp-mob",
    "https://happygentleman.com/wp-content/uploads/2022/08/Madrid_suit_Navy-3-picece-suit-for-men-happy-gentleman-5-400x400.webp",
    "https://www.knotstandard.com/assets/images/products/3411-listing.jpg?202304204",
    "https://www.tiptop.ca/cdn/shop/files/TT-5117-976-5016_navy_5215c3a6-846b-44f7-a365-8c53e0eb54da_600x600.jpg?v=1695061938",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_none,
              color: Color(0xffDD8560),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
        centerTitle: false,
        title: Text(
          "Hello Amr",
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
      body: ListView(
        primary: true,
        padding: EdgeInsets.all(17),
        children: [
          HeaderContainer(),
          SizedBox(
            height: 29,
          ),
          CategoryItems(),
          SizedBox(
            height: 10,
          ),
          FlashSaleItems(),
          // Text("Hello")
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                navigateTo(ProductDetailsView());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index],
                  height: 140,
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
