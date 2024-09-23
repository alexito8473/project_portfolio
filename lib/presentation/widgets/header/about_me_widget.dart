import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/presentation/widgets/customWidget/title_custom.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../data/dataSource/menu_items.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHome(
            title: AppLocalizations.of(context)!.aboutMe,
            subIcon: MenuItems.ABOUT_ME.getIcon(size: 40)),
        Container(
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.8,
            margin: EdgeInsets.only(
                bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.2),
            child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
              InformationContainerUnderLine(
                  havePaddingSubText: true,
                  width: 500,
                  subTitle: [
                    AppLocalizations.of(context)!.aboutMeDescription1,
                    AppLocalizations.of(context)!.aboutMeDescription2
                  ],
                  backgroundColor: Colors.grey,
                  textAlignSubTitle: TextAlign.justify,
                  haveMiddleDash: false,
                  textStyleSubTitle: TextStyle(
                      fontSize:
                          ResponsiveBreakpoints.of(context).isMobile ? 13 : 18,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                  width: 400,
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
                            countLineSubTitle: 2)
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
  final double width;
  final bool havePaddingSubText;
  final Color backgroundColor;
  final TextAlign? textAlignSubTitle;
  final TextStyle? textStyleSubTitle;
  final bool haveMiddleDash;

  const InformationContainerUnderLine(
      {super.key,
      this.title,
      required this.subTitle,
      this.countLineSubTitle,
      this.backgroundColor = Colors.indigo,
      this.textStyleSubTitle = const TextStyle(fontSize: 18),
      this.textAlignSubTitle,
      this.haveMiddleDash = true,
      this.width = 400,
      this.havePaddingSubText = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        padding: const EdgeInsets.all(40),
        margin: EdgeInsets.only(
            bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: backgroundColor.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? 20
                      : 10)
            ],
            border: context.watch<AppThemeBloc>().state.isDarkMode()
                ? const DashedBorder.fromBorderSide(
                    dashLength: 50,
                    side: BorderSide(color: Colors.white, width: 3))
                : const DashedBorder.fromBorderSide(
                    dashLength: 20,
                    side: BorderSide(color: Colors.black, width: 3)),
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
                (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AutoSizeText(
                        haveMiddleDash
                            ? "- ${subTitle[index]}"
                            : subTitle[index],
                        maxLines: countLineSubTitle,
                        textAlign: textAlignSubTitle,
                        style: textStyleSubTitle)),
              )),
        ]));
  }
}
