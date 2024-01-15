import 'dart:io';

import 'package:alalmiya_g3/core/logic/cache_helper.dart';
import 'package:alalmiya_g3/views/home/pages/home/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStates());
  List<String> images = [
    "https://suitshop.com/static/293859623009445dda723d7a6b1bcd1f/41ad3/spotlight-collection-mens-2.jpg",
    "https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/suits/default/Winter/P6733_1.jpg",
    "https://image.mooresclothing.ca/is/image/Moores/37DX_01_AWEARNESS_BY_KENNETH_COLE_SUIT_SEPARATE_JACKETS_BLACK_SOLID_MAIN?imPolicy=pdp-mob",
    "https://happygentleman.com/wp-content/uploads/2022/08/Madrid_suit_Navy-3-picece-suit-for-men-happy-gentleman-5-400x400.webp",
    "https://www.knotstandard.com/assets/images/products/3411-listing.jpg?202304204",
    "https://www.tiptop.ca/cdn/shop/files/TT-5117-976-5016_navy_5215c3a6-846b-44f7-a365-8c53e0eb54da_600x600.jpg?v=1695061938",
  ];

  Future<void> getData() async {
    emit(GetHomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    print("Bearer ${CacheHelper.getUserToken}");
    final response = await Dio(BaseOptions(headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper.getUserToken}",
    })).get("https://thimar.amr.aait-d.com/api/wallet");
    print(response.statusMessage);
    print(response.data);
    // print((response.data["data"]["token"]));
    // CacheHelper.setUserToken(response.data["data"]["token"]);

    emit(GetHomeSuccessState(list: images));
  }
}
