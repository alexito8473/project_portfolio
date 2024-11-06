import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../../data/dataSource/menu_items.dart';
import '../../../domain/blocs/appLocale/app_locale_bloc.dart';
import '../customWidget/custom_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  final ImageProvider assetImageUser;
  final GlobalKey activationKey;
  const HeaderWidget(
      {super.key, required this.assetImageUser, required this.activationKey});

  Color textColorSubTitle(BuildContext context) =>
      context.watch<AppThemeBloc>().state.isDarkMode()
          ? Colors.greenAccent
          : Colors.green;

  double textFontSubTitle(BuildContext context) =>
      ResponsiveBreakpoints.of(context).isMobile ? 24 : 28;

  double textFontTitle(BuildContext context) =>
      ResponsiveBreakpoints.of(context).isMobile ? 26 : 40;

  Color iconColorGitHub(BuildContext context) =>
      context.watch<AppThemeBloc>().state.isDarkMode()
          ? Colors.white
          : Colors.black;

  BoxConstraints? haveBoxConstraint(BuildContext context, double height) =>
      ResponsiveBreakpoints.of(context).isMobile
          ? BoxConstraints(minHeight: height)
          : null;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            height: ResponsiveBreakpoints.of(context).screenHeight,
            constraints: const BoxConstraints(minHeight: 700),
            width: ResponsiveBreakpoints.of(context).screenWidth,
            padding: ResponsiveBreakpoints.of(context).isMobile
                ? EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveBreakpoints.of(context).screenWidth * 0.15)
                : null,
            margin: EdgeInsets.only(
                top: ResponsiveBreakpoints.of(context).screenHeight * 0.12),
            child: Wrap(
                direction: Axis.horizontal,
                runSpacing: ResponsiveBreakpoints.of(context).screenHeight * .1,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: ResponsiveBreakpoints.of(context).screenWidth * .1,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: WidgetCircularAnimator(
                        outerColor: Colors.blueAccent,
                        innerColor: Colors.blueGrey,
                        size: ResponsiveBreakpoints.of(context).isMobile
                            ? 250
                            : 350,
                        child: ClipOval(
                            child: Image(
                                image: assetImageUser,
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  if (frame == null) {
                                    return const CircleAvatar(
                                        radius: 150,
                                        backgroundColor: Colors.white);
                                  }
                                  return child;
                                },
                                filterQuality: FilterQuality.none,
                                width: 300))),
                  ),
                  SizedBox(
                      key: activationKey,
                      width: 500,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 500,
                                height: 70,
                                child: AutoSizeText("Alejandro Aguilar Alba",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                        fontSize: textFontTitle(context)))),
                            const SizedBox(height: 20),
                            SizedBox(
                                width: 500,
                                height: 80,
                                child: AutoSizeText(
                                    AppLocalizations.of(context)!
                                        .descriptionHeader,
                                    maxLines: 3,
                                    minFontSize: 2,
                                    maxFontSize: 28,
                                    style: TextStyle(
                                        fontSize: textFontSubTitle(context),
                                        color: textColorSubTitle(context)))),
                            const SizedBox(height: 20),
                            Wrap(
                                alignment: WrapAlignment.center,
                                spacing:
                                    ResponsiveBreakpoints.of(context).isMobile
                                        ? 0
                                        : 30,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  IconButtonNavigator(
                                      uri: Uri.parse(
                                          'https://github.com/alexito8473'),
                                      color: iconColorGitHub(context),
                                      tooltip: 'Github',
                                      iconUri: 'assets/svg/github.svg',
                                      changeColor: true),
                                  IconButtonNavigator(
                                      uri: Uri.parse(
                                          'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                                      color: Colors.blue,
                                      tooltip: 'Linkedin',
                                      iconUri: 'assets/svg/linkedin.svg'),
                                  const ButtonDownloadPdf()
                                ])
                          ]))
                ])));
  }
}

class CustomAppBar extends StatelessWidget {
  final Function? changeScroll;
  final bool changeTop;
  final Widget? learning;
  const CustomAppBar(
      {super.key,
      required this.changeScroll,
      required this.changeTop,
      this.learning});

  int _countWidgetInPage({required BuildContext context}) {
    if (ResponsiveBreakpoints.of(context).screenWidth < 430) return 0;
    if (ResponsiveBreakpoints.of(context).screenWidth < 500) return 1;
    if (ResponsiveBreakpoints.of(context).screenWidth < 550) return 2;
    if (ResponsiveBreakpoints.of(context).screenWidth < 750) return 3;
    if (ResponsiveBreakpoints.of(context).screenWidth < 800) return 4;
    return 5;
  }

  double _widthAppBar({required BuildContext context}) {
    if (ResponsiveBreakpoints.of(context).screenWidth < 430) return 220;
    if (ResponsiveBreakpoints.of(context).screenWidth < 500) return 400;
    if (ResponsiveBreakpoints.of(context).screenWidth < 550) return 430;
    if (ResponsiveBreakpoints.of(context).screenWidth < 750) return 450;
    if (ResponsiveBreakpoints.of(context).screenWidth < 800) return 700;
    return 750;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "AppBar",
        child: Material(
            color: Colors.transparent,
            child: RepaintBoundary(
                child: Container(
                  color: Colors.transparent,
                    alignment: Alignment.center,
                    width: ResponsiveBreakpoints.of(context).screenWidth,
                    height: 80,
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.decelerate,
                        height: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: context
                                          .watch<AppThemeBloc>()
                                          .state
                                          .isDarkMode()
                                      ? Colors.white.withOpacity(0.4)
                                      : Colors.black.withOpacity(0.8),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ],
                            color:
                                context.watch<AppThemeBloc>().state.isDarkMode()
                                    ? Colors.grey[900]
                                    : Colors.grey[100],
                            borderRadius: BorderRadius.circular(40)),
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width:
                            !changeTop ? 220 : _widthAppBar(context: context),
                        child: Row(
                            mainAxisAlignment: changeTop
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: [
                              if (learning != null) learning!,
                              HeaderTop(
                                  initAnimation: changeTop,
                                  countWidget:
                                      _countWidgetInPage(context: context)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () => context
                                            .read<AppLocaleBloc>()
                                            .add(ChangeLocalEvent()),
                                        icon: Text(
                                            BlocProvider.of<AppLocaleBloc>(
                                                    context)
                                                .state
                                                .locale
                                                .getLenguajeCode(),
                                            style:
                                                const TextStyle(fontSize: 20))),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15, left: 15),
                                        child: IconButton(
                                            onPressed: () => context
                                                .read<AppThemeBloc>()
                                                .add(ChangeThemeEvent()),
                                            icon: BlocProvider.of<AppThemeBloc>(
                                                    context)
                                                .state
                                                .appTheme
                                                .getIcon())),
                                    if (changeScroll != null)
                                      DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                              customButton: const Icon(Icons.list,
                                                  size: 38),
                                              items: List.generate(
                                                  MenuItems.values.length,
                                                  (index) => DropdownMenuItem<int>(
                                                      value: index,
                                                      child: MenuItems.values[index]
                                                          .buildItem(context))),
                                              onChanged: (value) =>
                                                  changeScroll!(value),
                                              barrierColor:
                                                  Colors.black.withOpacity(0.4),
                                              dropdownStyleData: DropdownStyleData(
                                                  width: 170,
                                                  useSafeArea: true,
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 6),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(4),
                                                      color: context.watch<AppThemeBloc>().state.isDarkMode() ? Colors.grey.shade800 : Colors.blueAccent))))
                                  ])
                            ]))))));
  }
}

class HeaderTop extends StatelessWidget {
  final bool initAnimation;
  final int countWidget;
  const HeaderTop(
      {super.key, required this.initAnimation, required this.countWidget});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipOval(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: const BoxDecoration(
              image: DecorationImage(
            filterQuality: FilterQuality.none,
            image: AssetImage("assets/images/personal.webp"),
          )),
          width: countWidget > 4
              ? initAnimation
                  ? 50
                  : 0
              : 0,
        ),
      ),
      AnimatedContainer(
          margin: countWidget > 3
              ? initAnimation
                  ? const EdgeInsets.symmetric(horizontal: 15)
                  : EdgeInsets.zero
              : EdgeInsets.zero,
          duration: const Duration(milliseconds: 600),
          width: countWidget > 3
              ? initAnimation
                  ? 200
                  : 0
              : 0,
          child: const AutoSizeText("Alejandro Aguilar",
              maxLines: 1, style: TextStyle(fontSize: 25))),
      AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: countWidget > 2
              ? initAnimation
                  ? 30
                  : 0
              : 0,
          child: ButtonIconSvg(
              uri: Uri.parse('https://github.com/alexito8473'),
              tooltip: 'Github',
              iconUri: 'assets/svg/github.svg',
              changeColor: true)),
      AnimatedContainer(
          margin: countWidget > 1
              ? initAnimation
                  ? const EdgeInsets.symmetric(horizontal: 15)
                  : EdgeInsets.zero
              : EdgeInsets.zero,
          duration: const Duration(milliseconds: 1000),
          width: countWidget > 1
              ? initAnimation
                  ? 30
                  : 0
              : 0,
          child: ButtonIconSvg(
              uri: Uri.parse(
                  'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
              tooltip: 'Linkedin',
              iconUri: 'assets/svg/linkedin.svg')),
      AnimatedContainer(
          duration: initAnimation
              ? const Duration(milliseconds: 1200)
              : const Duration(milliseconds: 600),
          width: countWidget > 0
              ? initAnimation
                  ? 150
                  : 0
              : 0,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: const ButtonDownloadPdf())
    ]);
  }
}
