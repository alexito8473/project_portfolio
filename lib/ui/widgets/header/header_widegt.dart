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

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: ResponsiveBreakpoints.of(context).isMobile
          ? null
          : const BoxConstraints(minHeight: 800),
      height: ResponsiveBreakpoints.of(context).screenHeight * 0.9,
      width: ResponsiveBreakpoints.of(context).screenWidth,
      padding: ResponsiveBreakpoints.of(context).isMobile
          ? EdgeInsets.symmetric(
              horizontal: ResponsiveBreakpoints.of(context).screenWidth * 0.15)
          : null,
      margin: EdgeInsets.only(
        top: ResponsiveBreakpoints.of(context).screenWidth * 0.05,
      ),
      child: Wrap(
        direction: Axis.horizontal,
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
          Container(
              width: 500,
              constraints: ResponsiveBreakpoints.of(context).isMobile
                  ? null
                  : const BoxConstraints(minHeight: 400),
              height: ResponsiveBreakpoints.of(context).screenHeight * 0.65,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 65,
                      child: AutoSizeText(
                        "Alejandro Aguilar Alba",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: ResponsiveBreakpoints.of(context).isMobile
                                ? 25
                                : 60),
                      ),
                    ),
                    Container(
                      height: 95,
                      margin: EdgeInsets.symmetric(
                          vertical: ResponsiveBreakpoints.of(context).isMobile
                              ? 0
                              : 20),
                      child: AutoSizeText(
                          "Desarrollador Full Stack apasionado por la programación y el aprendizaje.",
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 25, color: Colors.greenAccent)),
                    ),
                    Wrap(
                        alignment: WrapAlignment.center,
                        spacing:
                            ResponsiveBreakpoints.of(context).isMobile ? 0 : 30,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconButtonNavigator(
                              uri: Uri.parse('https://github.com/alexito8473'),
                              color: context
                                      .watch<AppThemeBloc>()
                                      .state
                                      .isDarkMode()
                                  ? Colors.white
                                  : Colors.black,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ClipOval(
                    child: Image(
                        image: const AssetImage("assets/images/personal.webp"),
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (frame == null) {
                            return const CircleAvatar(
                                radius: 150, backgroundColor: Colors.white);
                          }
                          return child;
                        },
                        filterQuality: FilterQuality.none))),
            SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
            ),
            const AutoSizeText("Alejandro Aguilar",
                maxLines: 1, style: TextStyle(fontSize: 25)),
            SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
            ),
            ButtonIconSvg(
                uri: Uri.parse('https://github.com/alexito8473'),
                color: context.watch<AppThemeBloc>().state.isDarkMode()
                    ? Colors.white
                    : Colors.black,
                tooltip: 'Github',
                iconUri: 'assets/svg/github.svg',
                secondColor: true),
            SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
            ),
            ButtonIconSvg(
                uri: Uri.parse(
                    'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                color: Colors.blue,
                tooltip: 'Linkedin',
                iconUri: 'assets/svg/linkedin.svg',
                secondColor: false),
            SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
            ),
            const ButtonDownloadPdf(),
          ],
        ));
  }
}
