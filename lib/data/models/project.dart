import 'dart:core';

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
