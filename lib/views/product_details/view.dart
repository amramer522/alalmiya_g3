import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  List<String> sizes = ["S", "M", "L", "XL"];
  List<Color> colors = [Colors.red, Colors.yellow, Colors.black, Colors.blue, Colors.brown, Color(0xfff0f012)];

  int count = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.network(
            "https://st.mngbcn.com/rcs/pics/static/T5/fotos/S20/57093801_30_D1.jpg?ts=1690194791500&imwidth=412&imdensity=2",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * .65,
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 16, end: 16, top: 23),
              height: MediaQuery.of(context).size.height * .40,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Classic Blazar",
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(height: 30),
                    Text("Product Details", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "cotton sweat shirt with a text point",
                      style: TextStyle(fontSize: 16, color: Color(0xff727272)),
                    ),
                    Divider(height: 30),
                    Row(
                      children: [
                        Text(
                          "Quality",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 36,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text("$count"),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (count < 20) {
                                    count++;
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(height: 30),
                    Row(
                      children: [
                        Text(
                          "Color:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
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
                                    padding: EdgeInsetsDirectional.only(end: 20),
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
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        Text(
                          "Size:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
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
                                    padding: EdgeInsetsDirectional.only(end: 12),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      child: Text(
                                        sizes[index],
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        border: selectedSizeIndex == index ? Border.all() : null,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(color: Color(0xffF4F5F7), borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
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
                  padding: EdgeInsets.all(6),
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
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add To Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
