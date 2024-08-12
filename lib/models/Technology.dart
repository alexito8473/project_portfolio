import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
enum TypeLanguage { BACKEND, FRONTEND, MOBILE, TOOLS, LEARNING, SERVERS;

  String getTitle(BuildContext context){
    switch(this){
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
  }}

enum TypeDescription {
  JAVA,
  FLUTTER,
  PHP,
  PYTHON,
  NET_MAUI,
  ANDROID,
  KOTLIN;

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
    }
  }
}

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;
  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription});
}
