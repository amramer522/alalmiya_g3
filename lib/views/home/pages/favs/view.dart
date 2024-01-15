import 'package:alalmiya_g3/views/home/pages/favs/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'components/category_items.dart';
import 'components/item_favs.dart';
import 'cubit.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {

  final bloc = KiwiContainer().resolve<FavsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Wishlist")),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetFavsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetFavsSuccessState) {
            return Column(
              children: [
                const CategoryItems(),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 19),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 151 / 147),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => ItemFav(
                      model: state.list[index],
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Text("Failed");
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
