import 'dart:core';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';


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
            "assets/svg/programLanguage/firebase.svg",
            "assets/svg/github.svg"
          ],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject'));

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
        return "1234";
      case ProjectRelease.APP_STUDENT:
        return "adfadfdsafsdaf";
    }
  }
}

class Project {
  final String name;
  final String imgUrl;
  final String repositoryUrl;
  final List<String> imgIconLanguage;
  const Project(
      {required this.name,
      required this.imgUrl,
      required this.imgIconLanguage,
      required this.repositoryUrl});
}
