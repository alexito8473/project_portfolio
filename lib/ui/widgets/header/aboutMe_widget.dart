import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/widgets/customWidget/titleCustom.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../data/services/ServiceGithub.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHome(title: AppLocalizations.of(context)!.aboutMe),
        Container(
            constraints: ResponsiveBreakpoints.of(context).isDesktop
                ? null
                : const BoxConstraints(minHeight: 1000),
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
            height: ResponsiveBreakpoints.of(context).screenHeight,
            margin: const EdgeInsets.only(bottom: 30),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: ResponsiveBreakpoints.of(context).screenHeight * 0.05,
              children: [
                Container(
                    width: 450,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 20)
                        ],
                        border: DashedBorder.fromBorderSide(
                            dashLength: 15,
                            side: BorderSide(
                                color: context
                                        .watch<AppThemeBloc>()
                                        .state
                                        .isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                                width: 2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(30),
                    child: Text(
                        AppLocalizations.of(context)!.aboutMeDescription,
                        style: TextStyle(
                            fontSize: ResponsiveBreakpoints.of(context).isMobile
                                ? 15
                                : 20,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify)),
                Container(
                  width: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.only(
                            bottom:
                                ResponsiveBreakpoints.of(context).screenHeight *
                                    0.05),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 20)
                            ],
                            border: DashedBorder.fromBorderSide(
                                dashLength: 15,
                                side: BorderSide(
                                    color: context
                                            .watch<AppThemeBloc>()
                                            .state
                                            .isDarkMode()
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: AutoSizeText("Habilidades",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 30))),
                            AutoSizeText(
                                "- Resolución de problema\n- Trabajo en equipo\n- Comunicación proactiva\n- Trabajo en equipo",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      Container(
                        width: 450,
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.only(
                            bottom:
                                ResponsiveBreakpoints.of(context).screenHeight *
                                    0.05),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 20)
                            ],
                            border: DashedBorder.fromBorderSide(
                                dashLength: 15,
                                side: BorderSide(
                                    color: context
                                            .watch<AppThemeBloc>()
                                            .state
                                            .isDarkMode()
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: AutoSizeText("Github",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 30))),
                            AutoSizeText("Commits realizados: 203",
                                //${ServiceGithub.getInstance()?.allCountCommit}
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
