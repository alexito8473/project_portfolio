import 'dart:core';

import 'package:flutter/cupertino.dart';

enum ProjectRelease {
  TASTYDASH(
      project: Project(
          name: "TastyDash",
          imgUrl: [
            "assets/images/projects/tasty/4.webp",
            "assets/images/projects/tasty/3.webp",
            "assets/images/projects/tasty/1.webp",
            "assets/images/projects/tasty/2.webp",
            "assets/images/projects/tasty/5.webp",
          ],
          imgIconLanguage: [
            "assets/svg/programLanguage/flutter.svg",
            "assets/svg/programLanguage/firebase.svg",
            "assets/svg/intellij.svg",
          ],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  GOMOKU(
      project: Project(
          name: "Gomoku",
          imgUrl: [
            "assets/images/projects/goReversi/1.webp",
          ],
          imgIconLanguage: [
            "assets/svg/programLanguage/java.svg",
            "assets/svg/eclipse.svg",
          ],
          repositoryUrl:
              'https://github.com/alexito8473/gomoku-Alejandro-Aguilar')),
  OTELO(
      project: Project(
          name: "TastyDashProject",
          imgUrl: [
            "assets/images/projects/tasty/3.webp",
            "assets/images/projects/tasty/1.webp",
            "assets/images/projects/tasty/2.webp",
            "assets/images/projects/tasty/4.webp",
            "assets/images/projects/tasty/5.webp",
          ],
          imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  APP_TEACHER(
      project: Project(
          name: "TastyDashProject",
          imgUrl: [
            "assets/images/projects/tasty/3.webp",
            "assets/images/projects/tasty/1.webp",
            "assets/images/projects/tasty/2.webp",
            "assets/images/projects/tasty/4.webp",
            "assets/images/projects/tasty/5.webp",
          ],
          imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject')),
  APP_STUDENT(
      project: Project(
          name: "TastyDashProject",
          imgUrl: [
            "assets/images/projects/tasty/3.webp",
            "assets/images/projects/tasty/1.webp",
            "assets/images/projects/tasty/2.webp",
            "assets/images/projects/tasty/4.webp",
            "assets/images/projects/tasty/5.webp",
          ],
          imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
          repositoryUrl: 'https://github.com/alexito8473/TastyDashProject'));

  const ProjectRelease({required this.project});

  final Project project;

  String getDescription(BuildContext context) {
    switch (this) {
      case ProjectRelease.TASTYDASH:
        return "jkadhfkjlasdf";
      case ProjectRelease.GOMOKU:
        return "1dfsdaf";
      case ProjectRelease.OTELO:
        return "asdfasdf";
      case ProjectRelease.APP_TEACHER:
        return "1234";
      case ProjectRelease.APP_STUDENT:
        return "adfadfdsafsdaf";
    }
  }
}

class Project {
  final String name;
  final List<String> imgUrl;
  final String repositoryUrl;
  final List<String> imgIconLanguage;
  const Project(
      {required this.name,
      required this.imgUrl,
      required this.imgIconLanguage,
      required this.repositoryUrl});
}
