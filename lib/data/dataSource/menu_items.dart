import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

enum MenuItems {
  EXPERIENCE,
  CERTIFICATE,
  PROJECT,
  KNOWLEDGE,
  ABOUT_ME,
  CONTACT_ME;

  String getTitle(BuildContext context) {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return AppLocalizations.of(context)!.aboutMe;
      case MenuItems.KNOWLEDGE:
        return AppLocalizations.of(context)!.knowledge;
      case MenuItems.EXPERIENCE:
        return AppLocalizations.of(context)!.experience;
      case MenuItems.PROJECT:
        return AppLocalizations.of(context)!.projects;
      case MenuItems.CONTACT_ME:
        return AppLocalizations.of(context)!.contact_me;
      case MenuItems.CERTIFICATE:
        return AppLocalizations.of(context)!.certificate;
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
            child: Text(getTitle(context),
                style:Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)))
      ]);
}
