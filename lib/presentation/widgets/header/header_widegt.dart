import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/domain/cubits/appLocale/app_locale_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import '../../../data/dataSource/menu_items.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../customWidget/custom_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  final ImageProvider assetImageUser;
  final GlobalKey activationKey;
  const HeaderWidget(
      {super.key, required this.assetImageUser, required this.activationKey});

  Color textColorSubTitle(BuildContext context) =>
      context.watch<AppThemeCubit>().state.appTheme.isDarkMode()
          ? Colors.greenAccent
          : Colors.green;

  double textFontSubTitle(ResponsiveBreakpointsData responsiveBreakpoints) =>
      responsiveBreakpoints.isMobile ? 24 : 28;

  double textFontTitle(ResponsiveBreakpointsData responsiveBreakpoints) =>
      responsiveBreakpoints.isMobile ? 26 : 40;

  Color iconColorGitHub(BuildContext context) =>
      context.watch<AppThemeCubit>().state.appTheme.isDarkMode()
          ? Colors.white
          : Colors.black;

  BoxConstraints? haveBoxConstraint(
          ResponsiveBreakpointsData responsiveBreakpoints, double height) =>
      responsiveBreakpoints.isMobile ? BoxConstraints(minHeight: height) : null;

  Widget builderHeader(
      {required ResponsiveBreakpointsData responsiveBreakpoints,
      required BuildContext context}) {
    return Align(
        alignment: Alignment.center,
        child: Wrap(
            direction: Axis.horizontal,
            runSpacing: responsiveBreakpoints.screenHeight * .1,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: responsiveBreakpoints.screenWidth * .1,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: 500,
                child: WidgetCircularAnimator(
                    outerColor: Colors.blueAccent,
                    innerColor: Colors.blueGrey,
                    size: responsiveBreakpoints.isMobile ? 250 : 350,
                    child: ClipOval(
                        child: Image(
                            image: assetImageUser,
                            isAntiAlias: true,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (frame == null) {
                                return const CircleAvatar(
                                    radius: 150, backgroundColor: Colors.white);
                              }
                              return child;
                            },
                            filterQuality: FilterQuality.high,
                            width: 300))),
              ),
              Container(
                  margin: responsiveBreakpoints.isMobile
                      ? EdgeInsets.symmetric(
                          horizontal: responsiveBreakpoints.screenWidth * 0.1)
                      : null,
                  key: activationKey,
                  width: 500,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 500,
                            height: 80,
                            child: AutoSizeText("Alejandro Aguilar Alba",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                        fontSize: textFontTitle(
                                            responsiveBreakpoints)))),
                        SizedBox(
                            width: 500,
                            height: 80,
                            child: AutoSizeText(
                                AppLocalizations.of(context)!.descriptionHeader,
                                maxLines: 3,
                                minFontSize: 2,
                                maxFontSize: 28,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: textFontSubTitle(
                                            responsiveBreakpoints),
                                        color: textColorSubTitle(context)))),
                        Wrap(
                            alignment: WrapAlignment.center,
                            spacing: responsiveBreakpoints.isMobile ? 0 : 30,
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
            ]));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    return responsiveBreakpoints.isMobile ||
            responsiveBreakpoints.screenHeight < 600
        ? SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: responsiveBreakpoints.isMobile
                        ? responsiveBreakpoints.screenHeight * 0.1
                        : responsiveBreakpoints.screenHeight * 0.3),
                child: builderHeader(
                    responsiveBreakpoints: responsiveBreakpoints,
                    context: context)))
        : SliverFillRemaining(
            child: builderHeader(
                responsiveBreakpoints: responsiveBreakpoints,
                context: context));
  }
}

class CustomAppBar extends StatelessWidget {
  final Function? changeScroll;
  final bool changeTop;
  final Widget? learning;
  final Function onDoubleTap;
  final Function? reset;
  final bool canNotTapButton;
  const CustomAppBar(
      {super.key,
      required this.changeScroll,
      required this.changeTop,
      this.learning,
      required this.onDoubleTap,
      required this.canNotTapButton,
      this.reset});

  int _countWidgetInPage(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.screenWidth < 430) return 0;
    if (responsiveBreakpoints.screenWidth < 500) return 1;
    if (responsiveBreakpoints.screenWidth < 550) return 2;
    if (responsiveBreakpoints.screenWidth < 750) return 3;
    if (responsiveBreakpoints.screenWidth < 800) return 4;
    return 5;
  }

  double _widthAppBar(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.screenWidth < 430) return 220;
    if (responsiveBreakpoints.screenWidth < 500) return 400;
    if (responsiveBreakpoints.screenWidth < 550) {
      return reset != null ? 450 : 430;
    }
    if (responsiveBreakpoints.screenWidth < 750) {
      return reset != null ? 490 : 450;
    }
    if (responsiveBreakpoints.screenWidth < 800) return 700;
    return 750;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    return BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
      return RepaintBoundary(
          child: Center(
              child: Hero(
                  tag: "AppBar",
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onDoubleTap: () => onDoubleTap(),
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          child: AbsorbPointer(
                              absorbing: canNotTapButton,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 1200),
                                  curve: Curves.decelerate,
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: state.appTheme.isDarkMode()
                                                ? Colors.white.withOpacity(0.4)
                                                : Colors.black.withOpacity(0.8),
                                            blurRadius: 10,
                                            spreadRadius: 1)
                                      ],
                                      color: state.appTheme.isDarkMode()
                                          ? Colors.grey[900]
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(40)),
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: !changeTop
                                      ? reset == null
                                          ? 220
                                          : 260
                                      : _widthAppBar(
                                          responsiveBreakpoints:
                                              responsiveBreakpoints),
                                  child: Row(
                                      mainAxisAlignment: changeTop
                                          ? MainAxisAlignment.spaceBetween
                                          : MainAxisAlignment.center,
                                      children: [
                                        if (learning != null) learning!,
                                        HeaderTop(
                                            initAnimation: changeTop,
                                            countWidget: _countWidgetInPage(
                                                responsiveBreakpoints:
                                                    responsiveBreakpoints)),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (reset != null)
                                                IconButton(
                                                    onPressed: () => reset!(),
                                                    icon: const Icon(
                                                        Icons.lock_reset)),
                                              IconButton(
                                                  onPressed: () => context
                                                      .read<AppLocaleCubit>()
                                                      .changeLocal(),
                                                  icon: Text(
                                                      context
                                                          .watch<
                                                              AppLocaleCubit>()
                                                          .state
                                                          .locale
                                                          .getLenguajeCode(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge)),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, left: 5),
                                                  child: IconButton(
                                                      onPressed: () => context
                                                          .read<AppThemeCubit>()
                                                          .changeTheme(),
                                                      icon: state.appTheme
                                                          .getIcon())),
                                              if (changeScroll != null)
                                                DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                        customButton: const Icon(Icons.list,
                                                            size: 35),
                                                        items: List.generate(
                                                            MenuItems
                                                                .values.length,
                                                            (index) => DropdownMenuItem<int>(
                                                                value: index,
                                                                child: MenuItems.values[index].buildItem(
                                                                    context))),
                                                        onChanged: (value) =>
                                                            changeScroll!(
                                                                value),
                                                        barrierColor: Colors.black
                                                            .withOpacity(0.4),
                                                        dropdownStyleData: DropdownStyleData(
                                                            width: 180,
                                                            useSafeArea: true,
                                                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: state.appTheme.isDarkMode() ? Colors.grey.shade800 : Colors.blueAccent))))
                                            ])
                                      ]))))))));
    });
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
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                      image: AssetImage("assets/images/personal.webp"))),
              height: countWidget > 4
                  ? initAnimation
                      ? 40
                      : 0
                  : 0,
              width: countWidget > 4
                  ? initAnimation
                      ? 40
                      : 0
                  : 0)),
      AnimatedContainer(
          margin: countWidget > 3
              ? initAnimation
                  ? const EdgeInsets.symmetric(horizontal: 15)
                  : EdgeInsets.zero
              : EdgeInsets.zero,
          duration: const Duration(milliseconds: 700),
          width: countWidget > 3
              ? initAnimation
                  ? 180
                  : 0
              : 0,
          child: Text("Alejandro Aguilar",
              maxLines: 1, style: Theme.of(context).textTheme.titleLarge)),
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
