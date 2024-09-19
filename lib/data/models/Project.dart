import 'dart:core';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

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
