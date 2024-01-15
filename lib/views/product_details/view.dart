import 'package:alalmiya_g3/views/product_details/cubit.dart';
import 'package:alalmiya_g3/views/product_details/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ProductDetailsView extends StatefulWidget {
  final String image;
  const ProductDetailsView({Key? key, required this.image}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  List<String> sizes = ["S", "M", "L", "XL"];
  List<Color> colors = [Colors.red, Colors.yellow, Colors.black, Colors.blue, Colors.brown, const Color(0xfff0f012)];

  int count = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  bool isFav = false;

  final bloc = KiwiContainer().resolve<ProductDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
          ),
          extendBodyBehindAppBar: true,
          body: state is GetProductDetailsLoadingState?const Center(child: CircularProgressIndicator(),):Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Hero(
                tag: widget.image,
                child: Image.network(
                  widget.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .65,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 23),
                  height: MediaQuery.of(context).size.height * .40,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xffF4F5F7), borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Famale Style",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA4A4A4),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "5.0",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff979696)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Classic Blazar",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Divider(height: 30),
                        const Text("Product Details", style: TextStyle(fontSize: 16)),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "cotton sweat shirt with a text point",
                          style: TextStyle(fontSize: 16, color: Color(0xff727272)),
                        ),
                        const Divider(height: 30),
                        Row(
                          children: [
                            const Text(
                              "Quality",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 36,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (count > 1) {
                                        count--;
                                        setState(() {});
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text("$count"),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (count < 20) {
                                        count++;
                                        setState(() {});
                                      }
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(height: 30),
                        Row(
                          children: [
                            const Text(
                              "Color:",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ...List.generate(
                                colors.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        selectedColorIndex = index;
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.only(end: 20),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(border: selectedColorIndex == index ? Border.all(width: 2, strokeAlign: BorderSide.strokeAlignOutside) : null, shape: BoxShape.circle),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: colors[index],
                                          ),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Size:",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            ...List.generate(
                                sizes.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        selectedSizeIndex = index;
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.only(end: 12),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            border: selectedSizeIndex == index ? Border.all() : null,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            sizes[index],
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
            child: SafeArea(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      isFav = !isFav;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: isFav ? Colors.red : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add To Cart"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
