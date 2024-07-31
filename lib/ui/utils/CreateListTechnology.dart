import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

List<Technology> createListTechnology(BuildContext context) {
  return [
    Technology(
        name: "Java",
        progress: 80,
        urlIcon: "assets/images/java.png",
        color: const Color.fromRGBO(224, 31, 34, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "Python",
        progress: 30,
        urlIcon: "assets/images/python.png",
        color: const Color.fromRGBO(48, 105, 152, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "Dart",
        progress: 70,
        urlIcon: "assets/images/dart.png",
        color: const Color.fromRGBO(1, 117, 194, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "C#",
        progress: 60,
        urlIcon: "assets/images/c#.png",
        color: const Color.fromRGBO(155, 89, 182, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "PHP",
        progress: 60,
        urlIcon: "assets/images/php.png",
        color: const Color.fromRGBO(97, 124, 190, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "Kotlin",
        progress: 75,
        urlIcon: "assets/images/kotlin.png",
        color: const Color.fromRGBO(241, 142, 0, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "Sprint Boot",
        progress: 20,
        urlIcon: "assets/images/sprint.png",
        color: const Color.fromRGBO(139, 195, 74, 1),
        description: AppLocalizations.of(context)!.workExperience),
    Technology(
        name: "Flutter",
        progress: 80,
        urlIcon: "assets/images/flutter.png",
        color: const Color.fromRGBO(95, 201, 248, 1),
        description: AppLocalizations.of(context)!.workExperience),
  ];
}