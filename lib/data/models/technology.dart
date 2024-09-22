import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dataSource/tecnology_data.dart';

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final SvgTheme? svgTheme;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;

  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription,
      this.svgTheme});
}
