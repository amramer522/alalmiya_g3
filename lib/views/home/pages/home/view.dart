import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/home/pages/home/cubit.dart';
import 'package:alalmiya_g3/views/home/pages/home/states.dart';
import 'package:alalmiya_g3/views/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import 'components/category_items.dart';
import 'components/flash_sale_items.dart';
import 'components/header_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final bloc = KiwiContainer().resolve<HomeCubit>();
  final bloc = GetIt.instance<HomeCubit>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_none,
              color: Color(0xffDD8560),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
        centerTitle: false,
        title: const Text(
          "Hello Amr",
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
      body: BlocBuilder(
       bloc: bloc,
        builder: (context, state) {
          if (state is GetHomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetHomeSuccessState) {
            return ListView(
              primary: true,
              padding: const EdgeInsets.all(17),
              children: [
                const HeaderContainer(),
                const SizedBox(
                  height: 29,
                ),
                const CategoryItems(),
                const SizedBox(
                  height: 10,
                ),
                const FlashSaleItems(),
                // Text("Hello")
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      navigateTo( ProductDetailsView(
                        image: state.list[index],
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Hero(
                        tag: state.list[index],
                        child: Image.network(
                          state.list[index],
                          height: 140,
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text("Failed"),
            );
          }
        },
      ),
    );
  }
}
