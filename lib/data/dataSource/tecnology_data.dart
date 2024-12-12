import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/technology.dart';
enum TypeLanguage {
  ALL,
  BACKEND,
  FRONTEND,
  MOBILE,
  SERVERS,
  TOOLS;

  String getTitle(BuildContext context) {
    switch (this) {
      case TypeLanguage.BACKEND:
        return "Backend";
      case TypeLanguage.FRONTEND:
        return "Frontend";
      case TypeLanguage.MOBILE:
        return AppLocalizations.of(context)!.mobile;
      case TypeLanguage.TOOLS:
        return AppLocalizations.of(context)!.tools;
      case TypeLanguage.SERVERS:
        return AppLocalizations.of(context)!.server;
      case TypeLanguage.ALL:
        return AppLocalizations.of(context)!.all;
    }
  }
}

enum Knowledge {
  JAVA(technology: Technology(
      name: "Java",
      urlIcon: "assets/svg/programLanguage/java.svg",
      color: Color.fromRGBO(224, 31, 34, 1),
      typeLanguage: TypeLanguage.BACKEND)),
  FLUTTER(technology:Technology(
      name: "Flutter",
      urlIcon: "assets/svg/programLanguage/flutter.svg",
      color: Color.fromRGBO(95, 201, 248, 1),
      typeLanguage: TypeLanguage.MOBILE) ),
  PHP(technology:  Technology(
      name: "PHP",
      urlIcon: "assets/svg/programLanguage/php.svg",
      color: Color.fromRGBO(97, 124, 190, 1),
      typeLanguage: TypeLanguage.BACKEND)),
  NET_MAUI(technology: Technology(
      name: ".Net MAUI",
      urlIcon: "assets/svg/programLanguage/maui.svg",
      color: Color.fromRGBO(160, 139, 232, 1),
      typeLanguage: TypeLanguage.MOBILE)),
  ANDROID(technology:Technology(
      name: "Android",
      urlIcon: "assets/svg/programLanguage/android.svg",
      color: Color.fromRGBO(151, 192, 36, 1),
      typeLanguage: TypeLanguage.MOBILE) ),
  KOTLIN(technology: Technology(
      name: "Kotlin",
      urlIcon: "assets/svg/programLanguage/kotlin.svg",
      color: Color.fromRGBO(241, 142, 0, 1),
      typeLanguage: TypeLanguage.MOBILE)),
  HTML(technology:  Technology(
      name: "HTML",
      urlIcon: "assets/svg/programLanguage/html.svg",
      color: Color.fromRGBO(228, 77, 38, 1),
      typeLanguage: TypeLanguage.FRONTEND)),
  CSS(technology: Technology(
      name: "CSS",
      urlIcon: "assets/svg/programLanguage/css.svg",
      color: Color.fromRGBO(38, 77, 228, 1),
      typeLanguage: TypeLanguage.FRONTEND)),
  MYSQL(technology: Technology(
      name: "MySQL",
      urlIcon: "assets/svg/programLanguage/mysql.svg",
      color: Color.fromRGBO(0, 116, 143, 1),
      typeLanguage: TypeLanguage.SERVERS)),
  MONGO_DB(technology: Technology(
      name: "MongoDb",
      urlIcon: "assets/svg/programLanguage/mongoDb.svg",
      color: Color.fromRGBO(87, 174, 71, 1),
      typeLanguage: TypeLanguage.SERVERS)),
  FIREBASE(technology:  Technology(
      name: "Firebase",
      urlIcon: "assets/svg/programLanguage/firebase.svg",
      color: Color.fromRGBO(255, 196, 0, 1),
      typeLanguage: TypeLanguage.SERVERS)),
  GIT(technology: Technology(
      name: "GIT",
      urlIcon: "assets/svg/git.svg",
      color: Color.fromRGBO(240, 80, 51, 1),
      typeLanguage: TypeLanguage.TOOLS)),
  GITHUB(technology: Technology(
      name: "Github",
      urlIcon: "assets/svg/github.svg",
      color: Colors.grey,
      typeLanguage: TypeLanguage.TOOLS,
      changeColor: true)),
  SPRING(technology: Technology(
      name: "Spring Boot",
      urlIcon: "assets/svg/programLanguage/spring.svg",
      color: Color.fromRGBO(139, 195, 74, 1),
      typeLanguage: TypeLanguage.BACKEND)),
  JAVASCRIPT(technology: Technology(
      name: "JavaScript",
      urlIcon: "assets/svg/programLanguage/javascript.svg",
      color: Color.fromRGBO(214, 186, 50, 1),
      typeLanguage: TypeLanguage.FRONTEND));
  final Technology technology;
  const Knowledge({required this.technology});
  String getDescription(BuildContext context) {
    switch (this) {
      case Knowledge.JAVA:
        return AppLocalizations.of(context)!.javaExperience;
      case Knowledge.FLUTTER:
        return AppLocalizations.of(context)!.flutterExperience;
      case Knowledge.PHP:
        return AppLocalizations.of(context)!.phpExperience;
      case Knowledge.NET_MAUI:
        return AppLocalizations.of(context)!.netMauiExperience;
      case Knowledge.ANDROID:
        return AppLocalizations.of(context)!.androidExperience;
      case Knowledge.KOTLIN:
        return AppLocalizations.of(context)!.kotlinExperience;
      case Knowledge.HTML:
        return AppLocalizations.of(context)!.htmlExperience;
      case Knowledge.CSS:
        return AppLocalizations.of(context)!.cssExperience;
      case Knowledge.MYSQL:
        return AppLocalizations.of(context)!.mysqlExperience;
      case Knowledge.MONGO_DB:
        return AppLocalizations.of(context)!.mongoExperience;
      case Knowledge.FIREBASE:
        return AppLocalizations.of(context)!.firebaseExperience;
      case Knowledge.GIT:
        return AppLocalizations.of(context)!.gitExperience;
      case Knowledge.GITHUB:
        return AppLocalizations.of(context)!.gitHubExperience;
      case Knowledge.SPRING:
        return AppLocalizations.of(context)!.springExperience;
      case Knowledge.JAVASCRIPT:
        return AppLocalizations.of(context)!.javaScriptExperience;
    }
  }
}

