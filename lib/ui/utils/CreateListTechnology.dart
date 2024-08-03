import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

List<Technology> createListTechnology(BuildContext context) {
  AppLocalizations appLocalizations = AppLocalizations.of(context)!;
  return [
    Technology(
        name: "Java",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.BACKEND),
    Technology(
        name: "Python",
        urlIcon: "assets/images/python.png",
        color: const Color.fromRGBO(48, 105, 152, 1),
        description: appLocalizations.pythonExperience,
        typeLanguage: TypeLanguage.LEARNING),
    Technology(
        name: ".Net MAUI",
        urlIcon: "assets/images/c#.png",
        color: const Color.fromRGBO(155, 89, 182, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.MOBILE),
    Technology(
        name: "PHP",
        urlIcon: "assets/images/php.png",
        color: const Color.fromRGBO(97, 124, 190, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.BACKEND),
    Technology(
        name: "Kotlin",
        urlIcon: "assets/images/kotlin.png",
        color: const Color.fromRGBO(241, 142, 0, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.BACKEND),
    Technology(
        name: "Sprint Boot",
        urlIcon: "assets/images/sprint.png",
        color: const Color.fromRGBO(139, 195, 74, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.LEARNING),
    Technology(
        name: "Flutter",
        urlIcon: "assets/images/flutter.png",
        color: const Color.fromRGBO(95, 201, 248, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.MOBILE),
    Technology(
        name: "Android",
        urlIcon: "assets/images/flutter.png",
        color: const Color.fromRGBO(95, 201, 248, 1),
        description: appLocalizations.workExperience,
        typeLanguage: TypeLanguage.MOBILE),
    Technology(
        name: "HTML",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.FRONTEND),
    Technology(
        name: "CSS",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.FRONTEND),
    Technology(
        name: "JavaScript",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.LEARNING),
    Technology(
        name: "GIT",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.TOOLS),
    Technology(
        name: "GITHUB",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.TOOLS),
    Technology(
        name: "IntelliJ",
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: appLocalizations.javaExperience,
        typeLanguage: TypeLanguage.TOOLS),
  ];
}
