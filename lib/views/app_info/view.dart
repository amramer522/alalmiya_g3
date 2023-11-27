import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/design/my_app_bar.dart';

class AppInfoView extends StatelessWidget {
  final String title;

  const AppInfoView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: title,
      ),
      body: Html(
          data:
              "<p><font color=\"#000000\">تطبيق سلة ثمرة : من أفضل التطبيقات التى تساعدك على شراء المنتجات الزراعية والغذائية مثل  ( الخضار والفواكة واللحوم والمواد الغذائية ) اغتنم الفرصة ، وقم بتحميل  التطبيق الآن واستمتع بتجربة مميزة وفريدة .</font><br></p>"),
    );
  }
}
