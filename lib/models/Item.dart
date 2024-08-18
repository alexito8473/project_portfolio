import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

enum MenuItems {
  ABOUT_ME,
  EXPERIENCE,
  PROJECT,
  KNOWLEDGE,
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
    }
  }

  StatelessWidget getIcon() {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return const Icon(Icons.person, size: 25);
      case MenuItems.KNOWLEDGE:
        return const SvgIcon(icon: SvgIconData("assets/svg/languageCode.svg"));
      case MenuItems.EXPERIENCE:
        return const Icon(Icons.computer, size: 25);
      case MenuItems.PROJECT:
        return const SvgIcon(icon: SvgIconData("assets/svg/project.svg"));
      case MenuItems.CONTACT_ME:
        return const Icon(Icons.computer, size: 25);
    }
  }

  Widget buildItem(BuildContext context) {
    return Row(
      children: [
        getIcon(),
        const SizedBox(width: 10),
        Expanded(
          child: Text(getTitle(context),
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class MenuItem {
  const MenuItem({required this.text, required this.icon});

  final String text;
  final IconData icon;
}
