import 'package:animated_background/animated_background.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../../models/Technology.dart';
import '../screens/listTechnology_screens.dart';
import '../utils/CreateListTechnology.dart';
import '../screens/listProject_screens.dart';
import '../screens/works_widget.dart';
import '../screens/header_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>  {
  final Duration _durationAnimation = const Duration(milliseconds: 300);
  final ScrollController _scrollController = ScrollController();
  final List<Technology> listTechnology = createListTechnology();
  late List<Technology> listTechnologyMobile = listTechnology
      .where((element) => element.typeLanguage == TypeLanguage.MOBILE)
      .toList();
  late List<Technology> listTechnologyBackend = listTechnology
      .where((element) => element.typeLanguage == TypeLanguage.BACKEND)
      .toList();
  late List<Technology> listTechnologyFrontend = listTechnology
      .where((element) => element.typeLanguage == TypeLanguage.FRONTEND)
      .toList();
  late List<Technology> listTechnologyLearning = listTechnology
      .where((element) => element.typeLanguage == TypeLanguage.LEARNING)
      .toList();
  late List<Technology> listTechnologyTools = listTechnology
      .where((element) => element.typeLanguage == TypeLanguage.TOOLS)
      .toList();
  final List<GlobalKey> listGlobalKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Widget? navigationUp({required bool haveTopNavigation, required Size size}) {
    if (!haveTopNavigation) {
      return null;
    }
    return Container(
        height: 80,
        margin: EdgeInsets.only(
          left: size.width * 0.28,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  scrollToItem(listGlobalKey[0]);
                },
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
                onPressed: () {
                  scrollToItem(listGlobalKey[2]);
                },
                icon: Text(AppLocalizations.of(context)!.workExperience,
                    style: const TextStyle(fontSize: 25))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () {
                    scrollToItem(listGlobalKey[3]);
                  },
                  icon: const Text("Project",
                      style:  TextStyle(fontSize: 25))),
            ),
            IconButton(
              onPressed: () {
                scrollToItem(listGlobalKey[4]);
              },
              icon: const Text("Contact to me",
                  style:  TextStyle(fontSize: 25)),
            )
          ],
        ));
  }

  Widget? navigationBottom(
      {required bool haveNavigation,
      required Size size,
      required bool isMobile}) {
    if (haveNavigation) {
      return null;
    }
    double fount = isMobile ? 20 : 10;
    double margin = isMobile ? size.width * 0.1 : size.width * 0.03;
    AppLocalizations language = AppLocalizations.of(context)!;
    return Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.only(bottom: 10, left: margin, right: margin),
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
                  selectedFontSize: fount,
                  unselectedFontSize: fount,
                  onTap: (value) => scrollToItem(listGlobalKey[value]),
                  items: [
                    BottomNavigationBarItem(
                      label: language.aboutMe,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: language.technologies,
                      icon: const SvgIcon(
                          color: Colors.white,
                          icon: SvgIconData("assets/svg/languageCode.svg",
                              colorSource: SvgColorSource.specialColors)),
                    ),
                    BottomNavigationBarItem(
                      label: language.experience,
                      icon: const Icon(
                        Icons.computer,
                        color: Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: language.experience,
                      icon: const Icon(
                        Icons.computer,
                        color: Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: language.experience,
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isTopNavigation = size.width > 1400;
    bool isMobile = size.width > 750;
    double spacePadding = isMobile ? size.width * 0.03 : size.width * 0.01;
    double spaceFinal =
        size.width > 1200 ? size.width * 0.7 : size.width * 0.70;
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: navigationBottom(
            haveNavigation: isTopNavigation, size: size, isMobile: isMobile),
        appBar: AppBar(
          flexibleSpace:
              navigationUp(haveTopNavigation: isTopNavigation, size: size),
          shadowColor: Colors.black,
          toolbarHeight: 80,
          title: AnimatedPadding(
              duration: _durationAnimation,
              padding: EdgeInsets.only(left: spacePadding),
              child: const AutoSizeText(
                "Software developer",
                style: TextStyle(fontSize: 30),
                maxLines: 1,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AppLocaleBloc>().add(ChangeLocalEvent());
                },
                icon: Text(
                    context
                        .watch<AppLocaleBloc>()
                        .state
                        .locale
                        .getLenguajeCode(),
                    style: const TextStyle(fontSize: 25))),
            AnimatedPadding(
              duration: _durationAnimation,
              padding:
                  EdgeInsets.only(left: size.width * 0.01, right: spacePadding),
              child: IconButton(
                  onPressed: () {
                    context.read<AppThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
            ),
          ],
        ),
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: BlocBuilder<AppThemeBloc, AppThemeState>(
              builder: (context, state) {
                return  ListView(
                    controller: _scrollController,
                    children: [
                      HeaderWidget(
                        key: listGlobalKey[0],
                        size: size,
                        spaceFinal: spaceFinal,
                        isMobile: isMobile,
                        durationAnimation: _durationAnimation,
                      ),
                      TechnologyWidget(
                        key: listGlobalKey[1],
                        size: size,
                        spaceFinal: spaceFinal,
                        isMobile: isMobile,
                        listTechnologyTools: listTechnologyTools,
                        durationAnimation: _durationAnimation,
                        lisTechnologyMobile: listTechnologyMobile,
                        lisTechnologyBackend: listTechnologyBackend,
                        lisTechnologyFrontend: listTechnologyFrontend,
                        lisTechnologyLearning: listTechnologyLearning,
                      ),
                      EducationWidget(
                        key: listGlobalKey[2],
                        spaceFinal: spaceFinal,
                        size: size,
                        isMobile: isMobile,
                      ),
                      ListProjectWidget(
                        key: listGlobalKey[3],
                        durationAnimation: _durationAnimation,
                        isMobile: isMobile,
                        size: size,
                        spaceFinal: spaceFinal,
                      ),
                      EducationWidget(
                        key: listGlobalKey[4],
                        spaceFinal: spaceFinal,
                        size: size,
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                );
              },
            )));
  }
}
