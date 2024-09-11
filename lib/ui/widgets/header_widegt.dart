import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'customWidget/customButton_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: !ResponsiveBreakpoints.of(context).isMobile
              ? ResponsiveBreakpoints.of(context).screenHeight * .07
              : ResponsiveBreakpoints.of(context).screenHeight * .04,
          bottom: ResponsiveBreakpoints.of(context).screenHeight * .02,
          left: ResponsiveBreakpoints.of(context).screenWidth * .1,
          right: ResponsiveBreakpoints.of(context).screenWidth * .1),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          Hero(
              tag: "Image",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/personal.webp",
                  width:
                      ResponsiveBreakpoints.of(context).isDesktop ? 300 : 220,
                ),
              )),
          Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: DashedBorder.all(
                  color: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? Colors.white
                      : Colors.black,
                  dashLength: 40,
                  width: 2,
                  isOnlyCorner: true,
                  strokeAlign: BorderSide.strokeAlignInside,
                  strokeCap: StrokeCap.round,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      child: AutoSizeText(
                        "Alejandro Aguilar",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: ResponsiveBreakpoints.of(context).isMobile
                                ? 25
                                : 35),
                      ),
                    ),
                    Wrap(
                        alignment: WrapAlignment.spaceEvenly,
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
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                    child: Image.asset(
                  "assets/images/personal.webp",
                  filterQuality: FilterQuality.high,
                  width: 50,
                )),
                SizedBox(
                    width: ResponsiveBreakpoints.of(context).screenWidth * .01),
                const AutoSizeText("Alejandro Aguilar",
                    maxLines: 1, style: TextStyle(fontSize: 25)),
                SizedBox(
                    width: ResponsiveBreakpoints.of(context).screenWidth * .01),
                IconButtonNavigator(
                    uri: Uri.parse('https://github.com/alexito8473'),
                    color: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? Colors.white
                        : Colors.black,
                    tooltip: 'Github',
                    iconUri: 'assets/svg/github.svg',
                    secondColor: true),
                SizedBox(
                    width: ResponsiveBreakpoints.of(context).screenWidth * .01),
                IconButtonNavigator(
                    uri: Uri.parse(
                        'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                    color: Colors.blue,
                    tooltip: 'Linkedin',
                    iconUri: 'assets/svg/linkedin.svg',
                    secondColor: false),
                SizedBox(
                    width: ResponsiveBreakpoints.of(context).screenWidth * .01),
                const ButtonDownloadPdf(),
                SizedBox(
                    width: ResponsiveBreakpoints.of(context).screenWidth * .02),
              ],
            )));
  }
}
