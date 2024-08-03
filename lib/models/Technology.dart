import 'dart:ui';

enum TypeLanguage { BACKEND, FRONTEND,MOBILE, TOOLS, LEARNING }

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final String description;
  final TypeLanguage typeLanguage;
  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.description,
      required this.typeLanguage});
}
