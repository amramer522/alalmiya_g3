import 'package:alalmiya_g3/core/logic/cache_helper.dart';
import 'package:alalmiya_g3/get_it.dart';
import 'package:alalmiya_g3/kiwi.dart';
import 'package:alalmiya_g3/views/counter/view.dart';
import 'package:alalmiya_g3/views/home/pages/favs/cubit.dart';
import 'package:alalmiya_g3/views/home/pages/home/cubit.dart';
import 'package:alalmiya_g3/views/my_video_player/view.dart';
import 'package:alalmiya_g3/views/on_boarding/view.dart';
import 'package:alalmiya_g3/views/otp/view.dart';
import 'package:alalmiya_g3/views/product_details/cubit.dart';
import 'package:alalmiya_g3/views/splash/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/logic/helper_methods.dart';
import 'views/home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  // initKiwi();
  initGetIt();

  runApp(
    EasyLocalization(
      fallbackLocale: Locale("en"),
      startLocale: Locale("ar"),
      path: "assets/translations",
      supportedLocales: [Locale("ar"),Locale("en"),Locale("fr")],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF4F5F7),
        fontFamily: "Montserrat",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xffF9FAFB),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: const BorderSide(color: Color(0xffE5E7EB))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: const BorderSide(color: Color(0xffE5E7EB))),
        ),
        primarySwatch: getMaterialColor(const Color(0xffDD8560)),
        dividerColor: const Color(0xffA1A8B0),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            fixedSize: const Size.fromHeight(56),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      home: OnBoardingView(),
    );
  }
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);
}
/*
Navigator
Stateful
showDialog
showModelBottomSheet
---- Packages ----
1. dio
2. intl
3. animate_do
4. flutter_svg
5. pin_code_fields
6. flutter_html
7. image_picker
8. flutter_bloc
9. shared_preferences
10. flutter_screen_util
11. google_maps
12. url_launcher
13. maps_launcher
14. dotted_border
15. shimmer
16. lottie
17. flutter_rating_bar
18. video_player

....
19. audio_player
20. record
21. just_audio


---- Widgets ----
1. MaterialApp
2. Center
3. Text
4. Scaffold
5. AppBar
6. Drawer
7. FloatingActionButton
8. Icon
9. IconButton
10. Column
11. Image.network
12. Container
13. SizedBox
14. Row
15. SingleChildScrollView
16. ListView
17. Spacer
18. Expanded
19. CircleAvatar
20. ListView.builder
21. InkWell
22. Padding
23. GestureDetector
24. GridView.builder
25. BottomNavigationBar
26. Align
27. OutlinedButton
28. Image.asset
29. Wrap
30. Stack
31. GridView
32. Card
33. ClipRRect
34. ClipOval
35. DecoratedBox
36. Transform.translate
37. Transform.scale
38. Transform.rotate
39. ListTile
40. Divider
41. TextField
42. TextFormField
43. Checkbox
44. Switch
45. Text.rich
46. TextButton
47. FilledButton
48. TabBar ( TabBarView - DefaultTabController - Tab )
49. Form
50. Image.file
51. SafeArea
52. RotatedBox
......
50.Flexable
51.Chip
52.VeritcalDivider
53. CloseButton
54. BackButton
// Service Locator (Kiwi)
// user token in post man (Bearer)



// upload image to server
// FVM


 */
