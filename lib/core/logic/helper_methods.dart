import 'package:flutter/material.dart';

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
