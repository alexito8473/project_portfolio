import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dataSource/TecnologyData.dart';

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;
  final bool changeColor;
  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription,
      required this.changeColor});
}
