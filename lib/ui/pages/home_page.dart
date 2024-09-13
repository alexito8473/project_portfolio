import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/Item.dart';

import '../screens/home_screens.dart';
import '../widgets/header/aboutMe_widget.dart';
import '../widgets/contacMe/contactToMe_Widget.dart';
import '../widgets/footer/footer_widget.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/technology/listTechnology.dart';
import '../widgets/project/project_widget.dart';
import '../widgets/work/listWorks_widget.dart';

class HomePage extends StatefulWidget {
  final Widget bannerTop;
  const HomePage({super.key, required this.bannerTop});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final List<Widget> _listWidgetHome;
  late final List<GlobalKey> _listGlobalKey;
  late ImageProvider assetImage;
  final GlobalKey _headerKey = GlobalKey();
  bool isActiveBannerTop = false;
  @override
  void initState() {
    assetImage = const AssetImage("assets/images/personal.webp");
    loadWidget();
    super.initState();
  }

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _checkIfWidgetIsVisible() {
    ResponsiveBreakpointsData breakpointsData =
        ResponsiveBreakpoints.of(context);
    if (breakpointsData.isTablet) return;
    if (breakpointsData.isMobile) return;
    RenderBox? box =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      Offset position = box.localToGlobal(Offset.zero);

      // Obtén las dimensiones visibles del área de scroll
      double screenHeight = breakpointsData.screenHeight;

      // Verifica si el widget está dentro del rango visible
      // true cuando esta renderizado y false cuando no

      if (position.dy < screenHeight && position.dy + box.size.height > 0) {
        if (isActiveBannerTop) {
          setState(() {
            isActiveBannerTop = false;
          });
        }
      } else {
        if (!isActiveBannerTop) {
          setState(() {
            isActiveBannerTop = true;
          });
        }
      }
    }
  }

  Widget topNavigation() {
    return Container(
        padding:  EdgeInsets.symmetric(horizontal: ResponsiveBreakpoints.of(context).screenWidth * 0.035),
        height: ResponsiveBreakpoints.of(context).isMobile ? 60 : 80,
        alignment: Alignment.center,
        width: ResponsiveBreakpoints.of(context).screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveBreakpoints.of(context).isMobile
                ? const Expanded(
                    child: AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 25),
                    maxLines: 1,
                  ))
                : const AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 28),
                    maxLines: 1,
                  ),
            if (isActiveBannerTop &&
                !ResponsiveBreakpoints.of(context).isTablet &&
                !ResponsiveBreakpoints.of(context).isMobile)
              Expanded(child: FadeIn(child: widget.bannerTop)),
            SizedBox(
                width: ResponsiveBreakpoints.of(context).isMobile? ResponsiveBreakpoints.of(context).screenWidth * 0.4:180,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          onPressed: () => context
                              .read<AppLocaleBloc>()
                              .add(ChangeLocalEvent()),
                          icon: Text(
                              context
                                  .watch<AppLocaleBloc>()
                                  .state
                                  .locale
                                  .getLenguajeCode(),
                              style: const TextStyle(fontSize: 25))),
                      IconButton(
                          onPressed: () => context
                              .read<AppThemeBloc>()
                              .add(ChangeThemeEvent()),
                          icon: context
                              .watch<AppThemeBloc>()
                              .state
                              .appTheme
                              .getIcon()),
                      DropdownButtonHideUnderline(
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
                                  scrollToItem(_listGlobalKey[value]);
                                }
                              },
                              barrierColor: Colors.black.withOpacity(0.4),
                              dropdownStyleData: DropdownStyleData(
                                  width: 170,
                                  useSafeArea: true,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: context
                                              .watch<AppThemeBloc>()
                                              .state
                                              .isDarkMode()
                                          ? Colors.grey.shade800
                                          : Colors.blueAccent))))
                    ]))
          ],
        ));
  }

  void loadWidget() {
    _listGlobalKey = [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey()
    ];
    _listWidgetHome = [
      HeaderWidget( assetImageUser: assetImage,activationKey: _headerKey,),
      AboutMeWidget(key: _listGlobalKey[0]),
      EducationWidget(key: _listGlobalKey[1]),
      ListProject(key: _listGlobalKey[2]),
      ListTechnology(key: _listGlobalKey[3]),
      ContactToMeWidget(key: _listGlobalKey[4]),
      const FooterWidget()
    ];
  }

  @override
  Widget build(BuildContext context) {
    _checkIfWidgetIsVisible();
    return HomeScreen(
      scrollController: _scrollController,
      topNavigation: topNavigation(),
      checkIfWidgetIsVisible: _checkIfWidgetIsVisible,
      listWidgetHome: _listWidgetHome,
    );
  }
}
