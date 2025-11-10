import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

import '../../l10n/app_localizations.dart';

enum MenuItems {
  EXPERIENCE,
  CERTIFICATE,
  PROJECT,
  KNOWLEDGE,
  ABOUT_ME,
  CONTACT_ME;

  String getTitle(AppLocalizations locale) {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return locale.aboutMe;
      case MenuItems.KNOWLEDGE:
        return locale.knowledge;
      case MenuItems.EXPERIENCE:
        return locale.experience;
      case MenuItems.PROJECT:
        return locale.projects;
      case MenuItems.CONTACT_ME:
        return locale.contact_me;
      case MenuItems.CERTIFICATE:
        return locale.certificate;
    }
  }

  StatelessWidget getIcon({double size = 25}) {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return Icon(Icons.person, size: size);
      case MenuItems.KNOWLEDGE:
        return SvgIcon(
            icon: const SvgIconData("assets/svg/languageCode.svg"), size: size);
      case MenuItems.EXPERIENCE:
        return Icon(Icons.computer, size: size);
      case MenuItems.PROJECT:
        return SvgIcon(
            icon: const SvgIconData("assets/svg/project.svg"), size: size);
      case MenuItems.CONTACT_ME:
        return Icon(Icons.contact_page, size: size);
      case MenuItems.CERTIFICATE:
        return SvgIcon(
            icon: const SvgIconData("assets/svg/certificate.svg"), size: size);
    }
  }

  Widget buildItem(BuildContext context) => Row(children: [
        getIcon(),
        const SizedBox(width: 5),
        Expanded(
            child: Text(getTitle(AppLocalizations.of(context)!),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.bold)))
      ]);
}
