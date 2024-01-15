import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import 'views/home/pages/favs/cubit.dart';
import 'views/home/pages/home/cubit.dart';
import 'views/product_details/cubit.dart';

void initGetIt(){
  GetIt container = GetIt.instance;
  container.registerFactory(() => FavsCubit()..getData());
  container.registerFactory(() => ProductDetailsCubit()..getData());
  container.registerFactory(() => HomeCubit()..getData());

}