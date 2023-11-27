import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        children: [
          Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
                "https://media.licdn.com/dms/image/D4D03AQFHszHTeYFKvw/profile-displayphoto-shrink_800_800/0/1663237154241?e=1704931200&v=beta&t=OgJOo9cyBXbL9NbdLoa9uhPgseTrUel1muDJUwj2KeE"),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "Amr Bakr",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 25,
          ),
          ItemProfile(image: "profile.png", title: "Your Profile"),
          ItemProfile(image: "my_orders.png", title: "My Order"),
          ItemProfile(image: "payment_methods.png", title: "Payment Methods"),
          ItemProfile(image: "wishlist.png", title: "Wishlist"),
          ItemProfile(image: "setting.png", title: "Setting"),
          ItemProfile(image: "logout.png", title: "Log Out",onTap: () {
            navigateTo(LoginView(),keepHistory: false);
          },),
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
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 17),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Image.asset("assets/icons/$image", height: 20, width: 20, fit: BoxFit.scaleDown),
            SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
