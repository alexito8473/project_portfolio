import 'package:flutter/cupertino.dart';

import '../dataSource/tecnology_data.dart';

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final bool changeColor;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;

  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription,
      this.changeColor = false});
}
