import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../../models/Item.dart';
import '../../models/Technology.dart';

import '../screens/home_screens.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
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

  Widget topNavigation(
      {required Size size,
      required bool activeNavigationTop,
      required BuildContext context,
      required bool isMobile}) {
    EdgeInsets paddingOfButtons =
        const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5);
    EdgeInsets paddingButtons = const EdgeInsets.symmetric(horizontal: 10);
    return Container(
        padding: EdgeInsets.only(left: size.width * 0.040,right:size.width * 0.040,top: 10 ),
        height: 60,
        alignment: Alignment.center,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isMobile
                ? const Expanded(
                    child: AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                  ))
                : const AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                  ),
            if (activeNavigationTop)
              Expanded(
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(MenuItems.values.length, (index) {
                            return Padding(
                              padding: index % 2 == 0
                                  ? paddingButtons
                                  : EdgeInsets.zero,
                              child: IconButton(
                                  padding: paddingOfButtons,
                                  onPressed: () =>
                                      scrollToItem(listGlobalKey[index]),
                                  icon: AutoSizeText(
                                      MenuItems.values[index].getTitle(context),
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 25))),
                            );
                          }))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    onPressed: () =>
                        context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
                    icon: Text(
                        context
                            .watch<AppLocaleBloc>()
                            .state
                            .locale
                            .getLenguajeCode(),
                        style: const TextStyle(fontSize: 25))),
                Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.01,
                        right: !activeNavigationTop && !isMobile
                            ? 0
                            : size.width * 0.04),
                    child: IconButton(
                        onPressed: () => context
                            .read<AppThemeBloc>()
                            .add(ChangeThemeEvent()),
                        icon: context
                            .watch<AppThemeBloc>()
                            .state
                            .appTheme
                            .getIcon())),
                if (!activeNavigationTop)
                  Padding(
                      padding: EdgeInsets.only(left: size.width * 0.01),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          customButton: const Icon(Icons.list, size: 38),
                          items: List.generate(
                            MenuItems.values.length,
                            (index) {
                              return DropdownMenuItem<int>(
                                  value: index,
                                  child: MenuItems.values[index]
                                      .buildItem(context));
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
                              color: context
                                      .watch<AppThemeBloc>()
                                      .state
                                      .isDarkMode()
                                  ? Colors.grey.shade800
                                  : Colors.blueAccent,
                            ),
                          ),
                        ),
                      ))
              ],
            )
          ],
        ));
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
    bool activeNavigationTop = size.width > 1450;
    bool isMobile = size.width < 600;
    return HomeScreen(
      scrollController: _scrollController,
      listGlobalKey: listGlobalKey,
      activeNavigationTop: activeNavigationTop,
      size: size,
      createDialogTechnology: createDialogTechnology,
      bannerBackground: isMobile,
      topNavigation: topNavigation(
          size: size,
          activeNavigationTop: activeNavigationTop,
          context: context,
          isMobile: isMobile),
      isMobile: isMobile,
    );
  }
}
