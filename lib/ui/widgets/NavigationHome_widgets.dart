import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';

class NavigationTop extends StatelessWidget {
  final bool haveNavigation;
  final Size size;
  final Function scrollToItem;
  final List<GlobalKey> listGlobalKey;
  const NavigationTop(
      {super.key,
      required this.scrollToItem,
      required this.listGlobalKey,
      required this.haveNavigation,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return !haveNavigation
        ? const SizedBox()
        : Container(
            height: 80,
            margin: EdgeInsets.only(
              left: size.width * 0.28,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => scrollToItem(listGlobalKey[0]),
                    icon: Text(AppLocalizations.of(context)!.aboutMe,
                        style: const TextStyle(fontSize: 25))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                      onPressed: () {
                        scrollToItem(listGlobalKey[1]);
                      },
                      icon: Text(AppLocalizations.of(context)!.technologies,
                          style: const TextStyle(fontSize: 25))),
                ),
                IconButton(
                    onPressed: () => scrollToItem(listGlobalKey[2]),
                    icon: Text(AppLocalizations.of(context)!.workExperience,
                        style: const TextStyle(fontSize: 25))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                      onPressed: () => scrollToItem(listGlobalKey[3]),
                      icon: Text(AppLocalizations.of(context)!.projects,
                          style: const TextStyle(fontSize: 25))),
                ),
                IconButton(
                  onPressed: () => scrollToItem(listGlobalKey[4]),
                  icon: const Text("Contact to me",
                      style: TextStyle(fontSize: 25)),
                )
              ],
            ));
  }
}

class NavigationBottom extends StatelessWidget {
  final bool haveNavigation;
  final Size size;
  final bool isMobile;
  final Function scrollToItem;
  final bool isDarkMode;
  final List<GlobalKey> listGlobalKey;
  const NavigationBottom(
      {super.key,
      required this.haveNavigation,
      required this.size,
      required this.isMobile,
      required this.scrollToItem,
      required this.listGlobalKey,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return haveNavigation
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.only(
                bottom: 15,
                left: size.width * 0.025,
                right: size.width * 0.025),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  iconSize: 20,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  backgroundColor:
                      isDarkMode ? Colors.grey.shade700 : Colors.blue.shade900,
                  selectedFontSize: !isMobile ? 16 : 12,
                  unselectedFontSize: !isMobile ? 16 : 12,
                  onTap: (value) => scrollToItem(listGlobalKey[value]),
                  items: [
                    BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.aboutMe,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.technologies,
                      icon: const SvgIcon(
                          icon: SvgIconData("assets/svg/languageCode.svg")),
                    ),
                    BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.experience,
                      icon: const Icon(
                        Icons.computer,
                        color: Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                        label: AppLocalizations.of(context)!.projects,
                        icon: const SvgIcon(
                            icon: SvgIconData("assets/svg/project.svg"))),
                    BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.experience,
                      icon: const Icon(
                        Icons.computer,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )));
  }
}

class TitleHome extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final String title;
  const TitleHome(
      {super.key,
      required this.size,
      required this.spaceFinal,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        width: spaceFinal,
        child: Text(title, style: const TextStyle(fontSize: 40)));
  }
}
