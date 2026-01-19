import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:proyect_porfolio/presentation/pages/splash_page.dart';

void main() async {
  usePathUrlStrategy();
  runApp(SplashPage(
    active: (app) {
      runApp(app);
    },
  ));
}
