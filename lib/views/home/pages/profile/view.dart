import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/login/view.dart';
import 'package:flutter/material.dart';

import '../../../../core/logic/cache_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        children: [
          Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(CacheHelper.image),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            CacheHelper.email,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          const ItemProfile(image: "profile.png", title: "Your Profile"),
          const ItemProfile(image: "my_orders.png", title: "My Order"),
          const ItemProfile(image: "payment_methods.png", title: "Payment Methods"),
          const ItemProfile(image: "wishlist.png", title: "Wishlist"),
          const ItemProfile(image: "setting.png", title: "Setting"),
          ItemProfile(
            image: "logout.png",
            title: "Log Out",
            onTap: () async {
              await CacheHelper.clear();
              navigateTo(const LoginView(), keepHistory: false);
            },
          ),
        ],
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  final String image, title;
  final VoidCallback? onTap;

  const ItemProfile({Key? key, required this.image, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Image.asset("assets/icons/$image", height: 20, width: 20, fit: BoxFit.scaleDown),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
