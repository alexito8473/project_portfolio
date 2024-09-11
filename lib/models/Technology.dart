import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TypeLanguage {
  BACKEND,
  FRONTEND,
  MOBILE,
  TOOLS,
  LEARNING,
  SERVERS;

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
  ECLIPSE;

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
        //Falta arreglarlo
        return AppLocalizations.of(context)!.javaScriptExperience;
    }
  }
}

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;
  final bool changeColor;
  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription,
      required this.changeColor});
}
