import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/technology.dart';

enum TypeLanguage {
  ALL,
  BACKEND,
  FRONTEND,
  MOBILE,
  SERVERS,
  LEARNING,
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
      case TypeLanguage.LEARNING:
        return AppLocalizations.of(context)!.learning;
      case TypeLanguage.SERVERS:
        return AppLocalizations.of(context)!.server;
      case TypeLanguage.ALL:
        return AppLocalizations.of(context)!.all;
    }
  }
}

enum TypeDescription {
  JAVA,
  FLUTTER,
  PHP,
  PYTHON,
  NET_MAUI,
  ANDROID,
  KOTLIN,
  HTML,
  CSS,
  MYSQL,
  MONGO_DB,
  FIREBASE,
  GIT,
  GITHUB,
  INTELLIJ,
  SPRING,
  JAVASCRIPT,
  ECLIPSE,
  VISUAL_STUDIO;

  String getDescription(BuildContext context) {
    switch (this) {
      case TypeDescription.JAVA:
        return AppLocalizations.of(context)!.javaExperience;
      case TypeDescription.FLUTTER:
        return AppLocalizations.of(context)!.flutterExperience;
      case TypeDescription.PHP:
        return AppLocalizations.of(context)!.phpExperience;
      case TypeDescription.PYTHON:
        return AppLocalizations.of(context)!.pythonExperience;
      case TypeDescription.NET_MAUI:
        return AppLocalizations.of(context)!.netMauiExperience;
      case TypeDescription.ANDROID:
        return AppLocalizations.of(context)!.androidExperience;
      case TypeDescription.KOTLIN:
        return AppLocalizations.of(context)!.kotlinExperience;
      case TypeDescription.HTML:
        return AppLocalizations.of(context)!.htmlExperience;
      case TypeDescription.CSS:
        return AppLocalizations.of(context)!.cssExperience;
      case TypeDescription.MYSQL:
        return AppLocalizations.of(context)!.mysqlExperience;
      case TypeDescription.MONGO_DB:
        return AppLocalizations.of(context)!.mongoExperience;
      case TypeDescription.FIREBASE:
        return AppLocalizations.of(context)!.firebaseExperience;
      case TypeDescription.GIT:
        return AppLocalizations.of(context)!.gitExperience;
      case TypeDescription.GITHUB:
        return AppLocalizations.of(context)!.gitHubExperience;
      case TypeDescription.INTELLIJ:
        return AppLocalizations.of(context)!.intelIjExperience;
      case TypeDescription.SPRING:
        return AppLocalizations.of(context)!.springExperience;
      case TypeDescription.JAVASCRIPT:
        return AppLocalizations.of(context)!.javaScriptExperience;
      case TypeDescription.ECLIPSE:
        return AppLocalizations.of(context)!.eclipseExperience;
      case TypeDescription.VISUAL_STUDIO:
        return AppLocalizations.of(context)!.visualEstudioExperience;
    }
  }
}

List<Technology> createListTechnology() {
  return [
    const Technology(
        name: "Visual Studio",
        urlIcon: "assets/svg/visualStudio.svg",
        color: Color.fromRGBO(160, 139, 232, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.VISUAL_STUDIO),
    const Technology(
        name: "Java",
        urlIcon: "assets/svg/programLanguage/java.svg",
        color: Color.fromRGBO(224, 31, 34, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Python",
        urlIcon: "assets/svg/programLanguage/python.svg",
        color: Color.fromRGBO(48, 105, 152, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.PYTHON),
    const Technology(
        name: ".Net MAUI",
        urlIcon: "assets/svg/programLanguage/maui.svg",
        color: Color.fromRGBO(160, 139, 232, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.NET_MAUI),
    const Technology(
        name: "PHP",
        urlIcon: "assets/svg/programLanguage/php.svg",
        color: Color.fromRGBO(97, 124, 190, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.PHP),
    const Technology(
        name: "Kotlin",
        urlIcon: "assets/svg/programLanguage/kotlin.svg",
        color: Color.fromRGBO(241, 142, 0, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.KOTLIN),
    const Technology(
        name: "Spring Boot",
        urlIcon: "assets/svg/programLanguage/spring.svg",
        color: Color.fromRGBO(139, 195, 74, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.SPRING),
    const Technology(
        name: "Flutter",
        urlIcon: "assets/svg/programLanguage/flutter.svg",
        color: Color.fromRGBO(95, 201, 248, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.FLUTTER),
    const Technology(
        name: "Android",
        urlIcon: "assets/svg/programLanguage/android.svg",
        color: Color.fromRGBO(151, 192, 36, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.ANDROID),
    const Technology(
        name: "HTML",
        urlIcon: "assets/svg/programLanguage/html.svg",
        color: Color.fromRGBO(228, 77, 38, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.HTML),
    const Technology(
        name: "CSS",
        urlIcon: "assets/svg/programLanguage/css.svg",
        color: Color.fromRGBO(38, 77, 228, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.CSS),
    const Technology(
        name: "JavaScript",
        urlIcon: "assets/svg/programLanguage/javascript.svg",
        color: Color.fromRGBO(214, 186, 50, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.JAVASCRIPT),
    const Technology(
        name: "GIT",
        urlIcon: "assets/svg/git.svg",
        color: Color.fromRGBO(240, 80, 51, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.GIT),
    const Technology(
        name: "Github",
        urlIcon: "assets/svg/github.svg",
        color: Colors.grey,
        typeLanguage: TypeLanguage.TOOLS,
        changeColor: true,
        typeDescription: TypeDescription.GITHUB),
    const Technology(
        name: "IntelliJ",
        urlIcon: "assets/svg/intellij.svg",
        color: Color.fromRGBO(18, 124, 239, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.INTELLIJ),
    const Technology(
        name: "MySQL",
        urlIcon: "assets/svg/programLanguage/mysql.svg",
        color: Color.fromRGBO(0, 116, 143, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.MYSQL),
    const Technology(
        name: "MongoDb",
        urlIcon: "assets/svg/programLanguage/mongoDb.svg",
        color: Color.fromRGBO(87, 174, 71, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.MONGO_DB),
    const Technology(
        name: "Firebase",
        urlIcon: "assets/svg/programLanguage/firebase.svg",
        color: Color.fromRGBO(255, 196, 0, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.FIREBASE),
    const Technology(
        name: "Eclipse",
        urlIcon: "assets/svg/eclipse.svg",
        color: Color.fromRGBO(255, 196, 0, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.ECLIPSE),
  ];
}
