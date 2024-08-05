import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TypeLanguage { BACKEND, FRONTEND, MOBILE, TOOLS, LEARNING }

enum TypeDescription {
  JAVA,
  FLUTTER,
  PHP;

  String getDescription(BuildContext context) {
    switch (this) {
      case TypeDescription.JAVA:
        return AppLocalizations.of(context)!.javaExperience;
      case TypeDescription.FLUTTER:
        return AppLocalizations.of(context)!.flutterExperience;
      case TypeDescription.PHP:
        return AppLocalizations.of(context)!.phpExperience;
    }
  }
}

class Technology {
  final String name;
  final String urlIcon;
  final Color color;
  final TypeLanguage typeLanguage;
  final TypeDescription typeDescription;
  const Technology(
      {required this.name,
      required this.urlIcon,
      required this.color,
      required this.typeLanguage,
      required this.typeDescription});
}
