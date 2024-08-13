import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

enum MenuItems {
  ABOUT_ME,
  PROJECT,
  TECHNOLOGY,
  EXPERIENCE,
  CONTACT_ME;

  String getTitle(BuildContext context) {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return AppLocalizations.of(context)!.aboutMe;
      case MenuItems.TECHNOLOGY:
        return AppLocalizations.of(context)!.technologies;
      case MenuItems.EXPERIENCE:
        return AppLocalizations.of(context)!.experience;
      case MenuItems.PROJECT:
        return AppLocalizations.of(context)!.projects;
      case MenuItems.CONTACT_ME:
        return AppLocalizations.of(context)!.experience;
    }
  }

  StatelessWidget getIcon() {
    switch (this) {
      case MenuItems.ABOUT_ME:
        return const Icon(
          Icons.person,
          size: 25,
        );
      case MenuItems.TECHNOLOGY:
        return const SvgIcon(icon: SvgIconData( "assets/svg/languageCode.svg"));
      case MenuItems.EXPERIENCE:
        return const Icon(Icons.computer, size: 25,);
      case MenuItems.PROJECT:
        return const SvgIcon(icon: SvgIconData( "assets/svg/project.svg"));
      case MenuItems.CONTACT_ME:
        return const Icon(Icons.computer, size: 25,);
    }
  }

  Widget buildItem(BuildContext context) {
    return Row(
      children: [
        getIcon(),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            getTitle(context),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}
