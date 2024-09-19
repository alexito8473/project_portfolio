import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/Project.dart';
enum ProjectRelease {
  TASTYDASH(
      project: Project(
          name: "TastyDash",
          imgUrl: "assets/images/projects/tasty/1.webp",
          imgIconLanguage: [
            "assets/svg/programLanguage/flutter.svg",
            "assets/svg/programLanguage/firebase.svg",
            "assets/svg/intellij.svg",
            "assets/svg/github.svg",
          ],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  GOMOKU(
      project: Project(
          name: "Gomoku",
          imgUrl: "assets/images/projects/gomoku/1.png",
          imgIconLanguage: [
            "assets/svg/programLanguage/java.svg",
            "assets/svg/eclipse.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl:
          'https://github.com/alexito8473/gomoku-Alejandro-Aguilar')),
  OTELO(
      project: Project(
          name: "Otelo",
          imgUrl: "assets/images/projects/goReversi/1.webp",
          imgIconLanguage: [
            "assets/svg/programLanguage/java.svg",
            "assets/svg/eclipse.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/Go')),
  APP_TEACHER(
      project: Project(
          name: "App Teacher",
          imgUrl: "assets/images/projects/appTeacher/1_new.jpeg",
          imgIconLanguage: [
            "assets/svg/programLanguage/maui.svg",
            "assets/svg/visualStudio.svg",
            "assets/svg/programLanguage/firebase.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  APP_STUDENT(
      project: Project(
          name: "App Student",
          imgUrl: "assets/images/projects/appStudent/1.jpeg",
          imgIconLanguage: [
            "assets/svg/programLanguage/maui.svg",
            "assets/svg/visualStudio.svg",
            "assets/svg/programLanguage/firebase.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  ULTRA_RESTAURANT(
      project: Project(
          name: "Ultra Restaurant",
          imgUrl: "assets/images/projects/ultraRestaurant/1.webp",
          imgIconLanguage: [
            "assets/svg/programLanguage/kotlin.svg",
            "assets/svg/intellij.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/TrabajoAndroid')),
  IMC_CALCULATOR(
      project: Project(
          name: "Imc Calculator",
          imgUrl: "assets/images/projects/imcCalculator/1.webp",
          imgIconLanguage: [
            "assets/svg/programLanguage/maui.svg",
            "assets/svg/visualStudio.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/TrabajoAndroid'));

  const ProjectRelease({required this.project});

  final Project project;

  String getDescription(BuildContext context) {
    switch (this) {
      case ProjectRelease.TASTYDASH:
        return AppLocalizations.of(context)!.descriptionTasty;
      case ProjectRelease.GOMOKU:
        return AppLocalizations.of(context)!.descriptionGomoku;
      case ProjectRelease.OTELO:
        return AppLocalizations.of(context)!.descriptionOtelo;
      case ProjectRelease.APP_TEACHER:
        return AppLocalizations.of(context)!.descriptionAppTeacher;
      case ProjectRelease.APP_STUDENT:
        return AppLocalizations.of(context)!.descriptionAppStudent;
      case ProjectRelease.ULTRA_RESTAURANT:
        return AppLocalizations.of(context)!.descriptionUltraRestaurant;
      case ProjectRelease.IMC_CALCULATOR:

        return "Proyecto realizado en el framework .Net Maui, se trata de una calculadora sobre el índice de la masa corporal.";
    }
  }
}