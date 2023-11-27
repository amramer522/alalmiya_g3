import 'package:flutter/material.dart';

import 'core/logic/helper_methods.dart';
import 'views/add_address/view.dart';
import 'views/after_on_boarding/view.dart';
import 'views/app_info/view.dart';
import 'views/create_new_password/view.dart';
import 'views/edit_profile/view.dart';
import 'views/forget_password/view.dart';
import 'views/home/view.dart';
import 'views/login/view.dart';
import 'views/on_boarding/view.dart';
import 'views/otp/view.dart';
import 'views/payment_success/view.dart';
import 'views/pick_location/view.dart';
import 'views/product_details/view.dart';
import 'views/register/view.dart';
import 'views/splash/view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xffF4F5F7),
      fontFamily: "Montserrat",
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffF9FAFB),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: Color(0xffE5E7EB))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: Color(0xffE5E7EB))),
      ),
      primarySwatch: getMaterialColor(Color(0xffDD8560)),
      dividerColor: Color(0xffA1A8B0),
      textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      )),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: Size.fromHeight(56),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
    ),
    home: PickLocationView(),
  ));
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
 */
