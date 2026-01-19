import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/appLocale/app_locale_cubit.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import '../../../data/dataSource/menu_items.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../../../l10n/app_localizations.dart';
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

  double textFontSubTitle(Size size) => CalculateSize.isMobile(size) ? 24 : 28;

  double textFontTitle(Size size) => CalculateSize.isMobile(size) ? 26 : 40;

  Color iconColorGitHub(BuildContext context) =>
      context.watch<AppThemeCubit>().state.appTheme.isDarkMode()
          ? Colors.white
          : Colors.black;

  BoxConstraints? haveBoxConstraint(Size size, double height) =>
      CalculateSize.isMobile(size) ? BoxConstraints(minHeight: height) : null;

  Widget builderHeader({required Size size, required BuildContext context}) {
    final AppLocalizations locale=AppLocalizations.of(context)!;
    final bool isMobile = CalculateSize.isMobile(size);
    return Align(
        alignment: Alignment.center,
        child: Wrap(
            direction: Axis.horizontal,
            runSpacing: size.height * .1,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: size.width * .1,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: 500,
                child: WidgetCircularAnimator(
                    outerColor: Colors.blueAccent,
                    innerColor: Colors.blueGrey,
                    size: isMobile ? 250 : 350,
                    child: ClipOval(
                        child: Image(
                            image: assetImageUser,
                            isAntiAlias: false,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (frame == null) {
                                return const CircleAvatar(
                                    radius: 150, backgroundColor: Colors.white);
                              }
                              return child;
                            },
                            filterQuality: FilterQuality.none,
                            width: 300))),
              ),
              Container(
                  margin: isMobile
                      ? EdgeInsets.symmetric(horizontal: size.width * 0.1)
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
                                        fontSize: textFontTitle(size)))),
                        SizedBox(
                            width: 500,
                            height: 80,
                            child: AutoSizeText(
                                locale.descriptionHeader,
                                maxLines: 3,
                                minFontSize: 2,
                                maxFontSize: 28,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: textFontSubTitle(size),
                                        color: textColorSubTitle(context)))),
                        Wrap(
                            alignment: WrapAlignment.center,
                            spacing: isMobile ? 0 : 30,
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
    final Size size = MediaQuery.sizeOf(context);
    final bool isMobile=CalculateSize.isMobile(size);
    return isMobile || size.height < 600
        ? SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                    isMobile ? size.height * 0.1 : size.height * 0.3),
                child: builderHeader(size: size, context: context)))
        : SliverFillRemaining(
            child: builderHeader(size: size, context: context));
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

  int _countWidgetInPage({required Size size}) {
    if (size.width < 430) return 0;
    if (size.width < 500) return 1;
    if (size.width < 550) return 2;
    if (size.width < 750) return 3;
    if (size.width < 800) return 4;
    return 5;
  }

  double _widthAppBar({required Size size}) {
    if (size.width < 430) return 220;
    if (size.width < 500) return 400;
    if (size.width < 550) {
      return reset != null ? 450 : 430;
    }
    if (size.width < 750) {
      return reset != null ? 490 : 450;
    }
    if (size.width < 800) return 700;
    return 750;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
                                      : _widthAppBar(size: size),
                                  child: Row(
                                      mainAxisAlignment: changeTop
                                          ? MainAxisAlignment.spaceBetween
                                          : MainAxisAlignment.center,
                                      children: [
                                        if (learning != null) learning!,
                                        HeaderTop(
                                            initAnimation: changeTop,
                                            countWidget:
                                                _countWidgetInPage(size: size)),
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
