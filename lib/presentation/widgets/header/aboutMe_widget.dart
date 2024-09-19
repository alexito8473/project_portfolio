import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/presentation/widgets/customWidget/titleCustom.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHome(title: AppLocalizations.of(context)!.aboutMe),
        Container(
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.8,
            height: ResponsiveBreakpoints.of(context).screenHeight,
            constraints: const BoxConstraints(minHeight: 1100),
            child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
              InformationContainerUnderLine(
                subTitle: [AppLocalizations.of(context)!.aboutMeDescription],
                backgroundColor: Colors.grey,
                textAlignSubTitle: TextAlign.justify,
                haveMiddleDash: false,
                textStyleSubTitle: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).isMobile ? 15 : 20,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                  width: 450,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InformationContainerUnderLine(
                            title: AppLocalizations.of(context)!.skills,
                            subTitle: [
                              AppLocalizations.of(context)!.skills1,
                              AppLocalizations.of(context)!.skills2,
                              AppLocalizations.of(context)!.skills3
                            ],
                            countLineSubTitle: 2),
                        InformationContainerUnderLine(
                          title: 'Github',
                          subTitle: [
                            "${AppLocalizations.of(context)!.textCommit}: ${context.watch<AppServiceGithubBloc>().state.allCountCommit}"
                          ],
                          countLineSubTitle: 2,
                        ),
                      ]))
            ]))
      ],
    );
  }
}

class InformationContainerUnderLine extends StatelessWidget {
  final String? title;
  final List<String> subTitle;
  final int? countLineSubTitle;
  final Color backgroundColor;
  final TextAlign? textAlignSubTitle;
  final TextStyle? textStyleSubTitle;
  final bool haveMiddleDash;
  const InformationContainerUnderLine(
      {super.key,
      this.title,
      required this.subTitle,
      this.countLineSubTitle,
      this.backgroundColor = Colors.blueGrey,
      this.textStyleSubTitle = const TextStyle(fontSize: 18),
      this.textAlignSubTitle,
      this.haveMiddleDash = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 430,
        padding: const EdgeInsets.all(40),
        margin: EdgeInsets.only(
            bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? backgroundColor.withOpacity(0.3)
                      : backgroundColor.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? 20
                      : 10)
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
          if (title != null)
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AutoSizeText(title!,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.blueAccent, fontSize: 30))),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                subTitle.length,
                (index) => AutoSizeText(
                    haveMiddleDash ? "- ${subTitle[index]}" : subTitle[index],
                    maxLines: countLineSubTitle,
                    textAlign: textAlignSubTitle,
                    style: textStyleSubTitle)),
          ),
        ]));
  }
}
