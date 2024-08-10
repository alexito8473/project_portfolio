import 'dart:core';

class Project {
  final String name;
  final List<String> imgUrl;
  final String description;
  final List<String> imgIconLanguage;
  const Project(
      {required this.name,
      required this.imgUrl,
      required this.description,
      required this.imgIconLanguage});
}
