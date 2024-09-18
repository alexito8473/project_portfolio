import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import '../customWidget/customButton_widget.dart';

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
      ResponsiveBreakpoints.of(context).isMobile ? 20 : 25;
  double textFontTitle(BuildContext context) =>
      ResponsiveBreakpoints.of(context).isMobile ? 25 : 60;
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
    return Container(
      height: ResponsiveBreakpoints.of(context).screenHeight * 0.9,
      constraints: const BoxConstraints(minHeight: 700),
      width:  ResponsiveBreakpoints.of(context).screenWidth,
      padding: ResponsiveBreakpoints.of(context).isMobile
          ? EdgeInsets.symmetric(
              horizontal: ResponsiveBreakpoints.of(context).screenWidth * 0.15)
          : null,
      margin: EdgeInsets.only(
        top: ResponsiveBreakpoints.of(context).screenHeight * 0.1,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing:ResponsiveBreakpoints.of(context).screenHeight * .1,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: ResponsiveBreakpoints.of(context).screenWidth * .1,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            key: activationKey,
            width: 500,
            child: WidgetCircularAnimator(
                outerColor: Colors.blueAccent,
                innerColor: Colors.blueGrey,
                size: ResponsiveBreakpoints.of(context).isMobile ? 250 : 350,
                child: ClipOval(
                    child: Image(
                        image: assetImageUser,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (frame == null) {
                            return const CircleAvatar(
                                radius: 150, backgroundColor: Colors.white);
                          }
                          return child;
                        },
                        filterQuality: FilterQuality.none,
                        width: 300))),
          ),
          SizedBox(
              width: 500,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 500,
                        child: AutoSizeText(
                          "Alejandro Aguilar Alba",
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              fontSize: textFontTitle(context)),
                        )),
                    const SizedBox(height: 20),
                    AutoSizeText(
                        "Desarrollador Full Stack apasionado por la programación y el aprendizaje.",
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: textFontSubTitle(context),
                            color: textColorSubTitle(context))),
                    const SizedBox(height: 20),
                    Wrap(
                        alignment: WrapAlignment.center,
                        spacing:
                            ResponsiveBreakpoints.of(context).isMobile ? 0 : 30,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconButtonNavigator(
                              uri: Uri.parse('https://github.com/alexito8473'),
                              color: iconColorGitHub(context),
                              tooltip: 'Github',
                              iconUri: 'assets/svg/github.svg',
                              secondColor: true),
                          IconButtonNavigator(
                              uri: Uri.parse(
                                  'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                              color: Colors.blue,
                              tooltip: 'Linkedin',
                              iconUri: 'assets/svg/linkedin.svg',
                              secondColor: false),
                          const ButtonDownloadPdf()
                        ]),
                  ])),
        ],
      ),
    );
  }
}

class HeaderTop extends StatelessWidget {
  const HeaderTop({super.key});

  int countWidgetInPage(double widthPage) {
    if (widthPage < 650) return 0;
    if (widthPage < 682) return 1;
    if (widthPage < 730) return 2;
    if (widthPage < 980) return 3;
    if (widthPage < 1050) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    double widthPage = ResponsiveBreakpoints.of(context).screenWidth;
    int countWidget = countWidgetInPage(widthPage);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (countWidget == 5)
              FadeIn(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ClipOval(
                          child: Image(
                              image: const AssetImage(
                                  "assets/images/personal.webp"),
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                if (frame == null) {
                                  return const CircleAvatar(
                                      radius: 150,
                                      backgroundColor: Colors.white);
                                }

                                return child;
                              },
                              filterQuality: FilterQuality.none)))),
            if (countWidget == 5) SizedBox(width: widthPage * 0.01),
            if (countWidget > 3)
              const AutoSizeText("Alejandro Aguilar",
                  maxLines: 1, style: TextStyle(fontSize: 25)),
            if (countWidget > 3) SizedBox(width: widthPage * 0.01),
            if (countWidget > 2)
              ButtonIconSvg(
                  uri: Uri.parse('https://github.com/alexito8473'),
                  color: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? Colors.white
                      : Colors.black,
                  tooltip: 'Github',
                  iconUri: 'assets/svg/github.svg',
                  secondColor: true),
            if (countWidget > 2) SizedBox(width: widthPage * 0.01),
            if (countWidget > 1)
              ButtonIconSvg(
                  uri: Uri.parse(
                      'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                  color: Colors.blue,
                  tooltip: 'Linkedin',
                  iconUri: 'assets/svg/linkedin.svg',
                  secondColor: false),
            if (countWidget > 1) SizedBox(width: widthPage * 0.01),
            if (countWidget > 0)
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ButtonDownloadPdf()),
          ],
        ));
  }
}
