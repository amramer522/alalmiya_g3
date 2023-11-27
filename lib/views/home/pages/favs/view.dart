import 'package:flutter/material.dart';

import '../../../../core/logic/helper_methods.dart';
import '../../../product_details/view.dart';
import 'components/category_items.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  List<ProductModel> list = [
    ProductModel(
      id: 0,
      image: "https://suitshop.com/static/293859623009445dda723d7a6b1bcd1f/41ad3/spotlight-collection-mens-2.jpg",
      title: "classic blazar 0",
      isFav: true,
      rate: 4.6,
      price: 130,
    ),
    ProductModel(
        id: 1,
        image:
            "https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/suits/default/Winter/P6733_1.jpg",
        title: "classic blazar 1",
        isFav: true,
        rate: 4,
        price: 150),
    ProductModel(
        id: 2,
        image: "https://image.mooresclothing.ca/is/image/Moores/37DX_01_AWEARNESS_BY_KENNETH_COLE_SUIT_SEPARATE_JACKETS_BLACK_SOLID_MAIN?imPolicy=pdp-mob",
        title: "classic blazar 2",
        isFav: false,
        rate: 3.5,
        price: 180),
    ProductModel(
        id: 3,
        image: "https://happygentleman.com/wp-content/uploads/2022/08/Madrid_suit_Navy-3-picece-suit-for-men-happy-gentleman-5-400x400.webp",
        title: "classic blazar 3",
        isFav: true,
        rate: 4.6,
        price: 210),
    ProductModel(
      id: 4,
      image: "https://www.knotstandard.com/assets/images/products/3411-listing.jpg?202304204",
      title: "classic blazar 4",
      isFav: false,
      rate: 4.6,
      price: 199,
    ),
    ProductModel(
        id: 5,
        image: "https://www.tiptop.ca/cdn/shop/files/TT-5117-976-5016_navy_5215c3a6-846b-44f7-a365-8c53e0eb54da_600x600.jpg?v=1695061938",
        title: "classic blazar 5",
        isFav: false,
        rate: 2.6,
        price: 200),
    ProductModel(
        id: 6,
        image: "https://www.tiptop.ca/cdn/shop/files/TT-5117-976-5016_navy_5215c3a6-846b-44f7-a365-8c53e0eb54da_600x600.jpg?v=1695061938",
        title: "classic blazar 6",
        isFav: true,
        rate: 1.6,
        price: 999),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Wishlist")),
      body: Column(
        children: [
          CategoryItems(),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 19),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 151 / 147),
              itemCount: list.length,
              itemBuilder: (context, index) => ItemFav(
                model: list[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemFav extends StatefulWidget {
  final ProductModel model;

  const ItemFav({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemFav> createState() => _ItemFavState();
}

class _ItemFavState extends State<ItemFav> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(ProductDetailsView());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.model.image,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.model.isFav=!widget.model.isFav;
                    setState(() {

                    });
                  },
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 9, end: 13),
                      child: CircleAvatar(
                        child: Icon(widget.model.isFav?Icons.favorite:Icons.favorite_border),
                        backgroundColor: Colors.white.withOpacity(.50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Text(
                  widget.model.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.orange,
                ),
                Text(
                  widget.model.rate.toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff979696)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "\$${widget.model.price}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xffAB94A6)),
            ),
          )
        ],
      ),
    );
  }
}

class ProductModel {
  int id;
  String image, title;
  bool isFav;
  double rate, price;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.isFav,
    required this.rate,
    required this.price,
  });
}
