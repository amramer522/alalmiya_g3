import 'package:alalmiya_g3/views/home/pages/favs/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

class FavsCubit extends Cubit<FavsStates>
{
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


  FavsCubit():super(FavsStates());

  Future<void> getData() async {
    emit(GetFavsLoadingState());
    debugPrint("Hello Before".toString());
    // replace with real data
    await Future.delayed(const Duration(seconds: 2));
    debugPrint("Hello After".toString());
    emit(GetFavsSuccessState(list:list));
  }

}

// State Management  ( setState - Cubit - Bloc - Provider - GetX - Redux)
// Split Logic from design
// Refresh Specific Widget
// increase app performance