import 'package:alalmiya_g3/views/home/pages/cart/view.dart';
import 'package:alalmiya_g3/views/home/pages/favs/view.dart';
import 'package:alalmiya_g3/views/home/pages/home/view.dart';
import 'package:alalmiya_g3/views/home/pages/profile/view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;

  List<Widget> pages = [const HomePage(), const CartPage(), const FavsPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentPage,
        onTap: (value) {
          debugPrint(value.toString());
          currentPage = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
