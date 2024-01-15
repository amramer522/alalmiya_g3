import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<Object?> navigateTo(Widget page, {bool keepHistory = true}) {
  return Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => keepHistory,
  );
}

void openUrl(String url) async {
  bool canLaunch = await launchUrl(Uri.parse(url)).catchError((ex) {
    debugPrint(ex);
  });
  if (!canLaunch) {
    debugPrint("Can't Open This Link");
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text("Can't Open This Link"),
      ),
    );
  }
}
