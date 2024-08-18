import 'dart:core';

import 'package:flutter/cupertino.dart';

enum ProjectDescription {
  TASTY_DASH,
  GOMOKU;

  String getDescription(BuildContext context) {
    switch (this) {
      case ProjectDescription.TASTY_DASH:
        return "jkadhfkjlasdf";
      case ProjectDescription.GOMOKU:
        return "DFSDFSADF";
    }
  }
}

class Project {
  final String name;
  final List<String> imgUrl;
  final String repositoryUrl;
  final bool isApplicationMobile;
  final ProjectDescription projectDescription;
  final List<String> imgIconLanguage;
  const Project(
      {required this.name,
      required this.imgUrl,
      required this.projectDescription,
      required this.imgIconLanguage,
      required this.repositoryUrl,
      required this.isApplicationMobile});
}
