import 'dart:core';

import 'package:flutter/cupertino.dart';

enum ProjectDescription {
  TASTY_DASH;

  String getDescription(BuildContext context) {
    return "";
  }
}

class Project {
  final String name;
  final List<String> imgUrl;
  final ProjectDescription projectDescription;
  final List<String> imgIconLanguage;
  const Project(
      {required this.name,
      required this.imgUrl,
      required this.projectDescription,
      required this.imgIconLanguage});
}
