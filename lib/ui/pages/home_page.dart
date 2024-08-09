import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../screens/listTechnology_screens.dart';
import '../screens/listProject_screens.dart';
import '../screens/works_widget.dart';
import '../screens/header_screens.dart';
import '../widgets/customButtom_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> listGlobalKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isTopNavigation = size.width > 1400;
    bool isMobile = size.width < 450;
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: NavigationBottom(
          haveNavigation: isTopNavigation,
          size: size,
          isMobile: isMobile,
          scrollToItem: scrollToItem,
          listGlobalKey: listGlobalKey,
        ),
        appBar: AppBar(
          flexibleSpace: NavigationTop(
            haveNavigation: isTopNavigation,
            size: size,
            scrollToItem: scrollToItem,
            listGlobalKey: listGlobalKey,
          ),
          shadowColor: Colors.black,
          toolbarHeight: 80,
          title: AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: const AutoSizeText(
                "Software developer",
                style: TextStyle(fontSize: 30),
                maxLines: 1,
              )),
          actions: [
            IconButton(
                onPressed: () =>
                    context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
                icon: Text(
                    context
                        .watch<AppLocaleBloc>()
                        .state
                        .locale
                        .getLenguajeCode(),
                    style: const TextStyle(fontSize: 25))),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                  left: size.width * 0.01, right: size.width * 0.05),
              child: IconButton(
                  onPressed: () {
                    context.read<AppThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
            ),
          ],
        ),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeaderWidget(
                  key: listGlobalKey[0],
                  size: size,
                  isMobile: isMobile,
                  durationAnimation: const Duration(milliseconds: 300),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: size.height * 0.02, bottom: size.height * 0.01),
                    width: size.width * 0.70,
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      AppLocalizations.of(context)!.aboutMe,
                                      style: const TextStyle(fontSize: 40),
                                    )),
                                const ButtonDownloadPdf()
                              ])
                        : Wrap(
                            spacing: 10,
                            runSpacing: 20,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.spaceBetween,
                            runAlignment: WrapAlignment.center,
                            children: [
                                Text(
                                  AppLocalizations.of(context)!.aboutMe,
                                  style: const TextStyle(fontSize: 40),
                                ),
                                const ButtonDownloadPdf()
                              ])),
                SizedBox(
                    width: size.width * 0.70,
                    child: Text(
                      AppLocalizations.of(context)!.aboutMeDescription,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    )),
                Title(
                  key: listGlobalKey[1],
                  size: size,
                  spaceFinal: size.width * 0.70,
                  title: AppLocalizations.of(context)!.technologies,
                ),
                TechnologyWidget(
                  size: size,
                  isMobile: isMobile,
                  durationAnimation: const Duration(milliseconds: 300),
                  beveledRectangleBorder: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                Title(
                  key: listGlobalKey[2],
                  size: size,
                  spaceFinal: size.width * 0.70,
                  title: AppLocalizations.of(context)!.workExperience,
                ),
                EducationWidget(
                  size: size,
                  isMobile: isMobile,
                ),
                ListProjectWidget(
                  key: listGlobalKey[3],
                  durationAnimation: const Duration(milliseconds: 300),
                  isMobile: isMobile,
                  size: size,
                  spaceFinal: size.width * 0.70,
                ),
                Title(
                  key: listGlobalKey[4],
                  size: size,
                  spaceFinal: size.width * 0.70,
                  title: "aaaaaaa",
                ),
                EducationWidget(
                  size: size,
                  isMobile: isMobile,
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
              ],
            )));
  }
}

class Title extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final String title;
  const Title(
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
                      icon: const Text("Project",
                          style: TextStyle(fontSize: 25))),
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
  final List<GlobalKey> listGlobalKey;
  const NavigationBottom(
      {super.key,
      required this.haveNavigation,
      required this.size,
      required this.isMobile,
      required this.scrollToItem,
      required this.listGlobalKey});

  @override
  Widget build(BuildContext context) {
    return haveNavigation
        ? const SizedBox()
        : Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(
                bottom: 10, left: size.width * 0.03, right: size.width * 0.03),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                child: BlocBuilder<AppThemeBloc, AppThemeState>(
                  builder: (context, state) {
                    return BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      iconSize: 20,
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.white,
                      backgroundColor: state.appTheme == AppTheme.LIGHT
                          ? Colors.grey.shade700
                          : Colors.blue.shade900,
                      selectedFontSize: !isMobile ? 20 : 12,
                      unselectedFontSize: !isMobile ? 20 : 12,
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
                              color: Colors.white,
                              icon: SvgIconData("assets/svg/languageCode.svg",
                                  colorSource: SvgColorSource.specialColors)),
                        ),
                        BottomNavigationBarItem(
                          label: AppLocalizations.of(context)!.experience,
                          icon: const Icon(
                            Icons.computer,
                            color: Colors.white,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: AppLocalizations.of(context)!.experience,
                          icon: const Icon(
                            Icons.computer,
                            color: Colors.white,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: AppLocalizations.of(context)!.experience,
                          icon: const Icon(
                            Icons.computer,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                )));
  }
}
