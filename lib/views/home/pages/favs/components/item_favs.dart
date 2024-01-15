
import 'package:flutter/material.dart';

import '../../../../../core/logic/helper_methods.dart';
import '../../../../product_details/view.dart';
import '../model.dart';

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
        navigateTo( ProductDetailsView(image: widget.model.image,));
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
                  child: Hero(
                    tag: widget.model.image,
                    child: Image.network(
                      widget.model.image,
                      fit: BoxFit.cover,
                    ),
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
                      padding: const EdgeInsetsDirectional.only(top: 9, end: 13),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.50),
                        child: Icon(widget.model.isFav?Icons.favorite:Icons.favorite_border),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Text(
                  widget.model.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.orange,
                ),
                Text(
                  widget.model.rate.toString(),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff979696)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "\$${widget.model.price}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xffAB94A6)),
            ),
          )
        ],
      ),
    );
  }
}
