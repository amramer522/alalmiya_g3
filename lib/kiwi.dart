import 'package:kiwi/kiwi.dart';

import 'views/home/pages/favs/cubit.dart';
import 'views/home/pages/home/cubit.dart';
import 'views/product_details/cubit.dart';

void initKiwi()
{
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => FavsCubit()..getData());
  container.registerFactory((container) => ProductDetailsCubit()..getData());
  container.registerFactory((container) => HomeCubit()..getData());

}
