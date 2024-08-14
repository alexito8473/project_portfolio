import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/utils/CreateListProject.dart';
import '../../models/Item.dart';
import '../../models/Project.dart';
import '../../models/Technology.dart';
import '../screens/homeMobile_screens.dart';
import '../screens/homeDesktop_screens.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Project> listProject = createListProject();
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

  Widget? topNavigation(
      {required Size size,
      required bool haveNavigation,
      required BuildContext context}) {
    if (!haveNavigation) {
      return null;
    }
    EdgeInsets paddingOfButtons =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    EdgeInsets paddingButtons = const EdgeInsets.symmetric(horizontal: 10);
    return Container(
        height: 70,
        margin: EdgeInsets.only(left: (size.width * 0.32) - 100),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(MenuItems.values.length, (index) {
              return Padding(
                padding: index % 2 == 0 ? paddingButtons : EdgeInsets.zero,
                child: IconButton(
                    padding: paddingOfButtons,
                    onPressed: () => scrollToItem(listGlobalKey[index]),
                    icon: AutoSizeText(
                        MenuItems.values[index].getTitle(context),
                        maxLines: 1,
                        style: const TextStyle(fontSize: 25))),
              );
            })));
  }

  PreferredSizeWidget appBarNavigation(
      {required bool isTopNavigation,
      required bool isMobile,
      required Size size,
      required BuildContext context}) {
    return AppBar(
      flexibleSpace: topNavigation(
          size: size, haveNavigation: isTopNavigation, context: context),
      shadowColor: Colors.black,
      toolbarHeight: isMobile ? 60 : 80,
      title: AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(left: size.width * 0.04),
          child: const AutoSizeText(
            "Full Stack Developer",
            style: TextStyle(fontSize: 30),
            maxLines: 1,
          )),
      actions: [
        IconButton(
            onPressed: () =>
                context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
            icon: Text(
                context.watch<AppLocaleBloc>().state.locale.getLenguajeCode(),
                style: const TextStyle(fontSize: 25))),
        Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.01,
                right: !isTopNavigation && !isMobile ? 0 : size.width * 0.04),
            child: IconButton(
                onPressed: () =>
                    context.read<AppThemeBloc>().add(ChangeThemeEvent()),
                icon: context.watch<AppThemeBloc>().state.appTheme.getIcon())),
        if (!isTopNavigation && !isMobile)
          Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.01, right: size.width * 0.04),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  customButton: const Icon(
                    Icons.list,
                    size: 38,
                  ),
                  items: List.generate(
                    MenuItems.values.length,
                    (index) {
                      return DropdownMenuItem<int>(
                          value: index,
                          child: MenuItems.values[index].buildItem(context));
                    },
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      scrollToItem(listGlobalKey[value]);
                    }
                  },
                  barrierColor: Colors.black.withOpacity(0.4),
                  dropdownStyleData: DropdownStyleData(
                    width: 170,
                    useSafeArea: true,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: context.watch<AppThemeBloc>().state.isDarkMode()
                          ? Colors.grey.shade700
                          : Colors.blue.shade900,
                    ),
                  ),
                ),
              ))
      ],
    );
  }

  void createDialogTechnology(BuildContext context, Technology technology,
      bool isMobile, bool isDarkMode) {
    Color background = isDarkMode ? Colors.black : Colors.white;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: isDarkMode ? Colors.white10 : Colors.black12,
          content: Container(
            width: 350,
            height: !isMobile ? 380 : 430,
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        transform: const GradientRotation(0.3),
                        stops: const [
                          0.85,
                          0.85,
                          1,
                          1
                        ],
                        colors: [
                          background,
                          technology.color.withOpacity(0.5),
                          technology.color.withOpacity(0.5),
                          background
                        ])),
                child: Column(
                  children: [
                    SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                maxLines: 2,
                                '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close))
                          ],
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AutoSizeText(
                        technology.typeDescription.getDescription(context),
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    )),
                    Container(
                        height: 60,
                        alignment: Alignment.bottomLeft,
                        child: SvgPicture.asset(
                          technology.urlIcon,
                          width: 60,
                        )),
                  ],
                )),
          ),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 24.0, // Controla la sombra para el efecto de elevación
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isTopNavigation = size.width > 1450;
    bool isMobile = size.width < 500;
    bool bannerBackground = size.width < 600;
    return isMobile
        ? HomeMobileScreens(
            appBarNavigation: appBarNavigation(
                isTopNavigation: isTopNavigation,
                size: size,
                context: context,
                isMobile: true),
            isTopNavigation: isTopNavigation,
            size: size,
            createDialogTechnology: createDialogTechnology,
            listProject: listProject,
            bannerBackground: bannerBackground,
          )
        : HomeDesktopScreens(
            scrollController: _scrollController,
            appBarNavigation: appBarNavigation(
                isTopNavigation: isTopNavigation,
                size: size,
                context: context,
                isMobile: false),
            listGlobalKey: listGlobalKey,
            isTopNavigation: isTopNavigation,
            size: size,
            createDialogTechnology: createDialogTechnology,
            listProject: listProject,
            bannerBackground: bannerBackground,
          );
  }
}
