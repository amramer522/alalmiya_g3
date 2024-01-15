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