import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/structure/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/widgets/customWidget/titleCustom.dart';
import 'package:responsive_framework/responsive_framework.dart';


class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHome(title: AppLocalizations.of(context)!.aboutMe),
        Container(
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
            height: ResponsiveBreakpoints.of(context).screenHeight,
            constraints: const BoxConstraints(minHeight: 1100),
            child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing:
                    ResponsiveBreakpoints.of(context).screenHeight * 0.05,
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
                      child: AutoSizeText(
                          AppLocalizations.of(context)!.aboutMeDescription,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isMobile
                                      ? 15
                                      : 20,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.justify)),
                   SizedBox(
                      width: 450,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const InformationContainerUnderLine(
                              title: "Habilidades",
                              subTitle: [
                                "- Resolución de problema",
                                "- Trabajo en equipo",
                                "- Comunicación proactiva"
                              ],
                              countLineSubTitle: 2,
                            ),
                            InformationContainerUnderLine(
                              title: 'Github',
                              subTitle: ["Commits realizados: ${context.watch<AppServiceGithubBloc>().state.allCountCommit}"],
                              countLineSubTitle: 2,
                            ),
                          ]))
                ]))
      ],
    );
  }
}

class InformationContainerUnderLine extends StatelessWidget {
  final String title;
  final List<String> subTitle;
  final int countLineSubTitle;
  const InformationContainerUnderLine(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.countLineSubTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 450,
        padding: const EdgeInsets.all(40),
        margin: EdgeInsets.only(
            bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
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
                    color: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? Colors.white
                        : Colors.black,
                    width: 2)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AutoSizeText(title,
                  maxLines: 1,
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 30))),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                subTitle.length,
                (index) => AutoSizeText(subTitle[index],
                    maxLines: countLineSubTitle,
                    //${ServiceGithub.getInstance()?.allCountCommit}
                    style: const TextStyle(fontSize: 18))),
          ),
        ]));
  }
}
