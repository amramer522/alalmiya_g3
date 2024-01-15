import 'package:alalmiya_g3/core/logic/helper_methods.dart';
import 'package:alalmiya_g3/views/after_on_boarding/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage = 1;

  List<String> titles = ["Welcome To\nFashion", "Explore & Shop", "Hi,Shop Now"];
  List<String> descriptions = [
    "Discover the latest trends and exclusive styles\nfrom our top designers",
    "Discover a wide range of fashion categories,\nbrowse new arrivals and shop your favourites",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/on_boarding$currentPage.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      context.setLocale(Locale(context.locale.languageCode=="en"?"ar":"en"));
                    },
                    icon: Icon(Icons.language)),
                if (currentPage != 3)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: OutlinedButton(
                      onPressed: () {
                        navigateTo(const AfterOnBoardingView());
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(color: Colors.black)),
                      child: Text("skip".tr()),
                    ),
                  ),
                const Spacer(),
                Text(
                  titles[currentPage - 1],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 36),
                ),
                if (currentPage != 3)
                  Text(descriptions[currentPage - 1],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      if (currentPage != 1)
                        GestureDetector(
                          onTap: () {
                            currentPage--;
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsetsDirectional.only(start: 10),
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xff4E6542))),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffDD8560),
                            ),
                          ),
                        ),
                      const Spacer(),
                      CircleAvatar(
                        radius: currentPage == 1 ? 7.5 : 5,
                        backgroundColor: currentPage == 1 ? const Color(0xffDD8560) : const Color(0xffD9D9D9),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: currentPage == 2 ? 7.5 : 5,
                        backgroundColor: currentPage == 2 ? const Color(0xffDD8560) : const Color(0xffD9D9D9),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: currentPage == 3 ? 7.5 : 5,
                        backgroundColor: currentPage == 3 ? const Color(0xffDD8560) : const Color(0xffD9D9D9),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (currentPage == 3) {
                            navigateTo(const AfterOnBoardingView());
                          } else {
                            currentPage++;
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsetsDirectional.only(start: 3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffDD8560),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
