import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../screens/home_screens.dart';
import '../widgets/NavigationHome_widgets.dart';

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

  PreferredSizeWidget appBarNavigation(
      {required bool isTopNavigation,
      required Size size,
      required BuildContext context}) {
    return AppBar(
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
                context.watch<AppLocaleBloc>().state.locale.getLenguajeCode(),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isTopNavigation = size.width > 1450;
    bool isMobile = size.width < 450;
    return BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, state) {
      return HomeScreens(
        scrollToItem: scrollToItem,
        scrollController: _scrollController,
        appBarNavigation: appBarNavigation(
            isTopNavigation: isTopNavigation, size: size, context: context),
        listGlobalKey: listGlobalKey,
        isTopNavigation: isTopNavigation,
        isMobile: isMobile,
        size: size,
        isDarkMode: state.appTheme == AppTheme.DARK,
      );
    });
  }
}
