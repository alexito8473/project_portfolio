import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  double witchBox({required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return responsiveBreakpoints.screenWidth * 0.8;
    }
    if (responsiveBreakpoints.screenWidth < 1000) {
      return responsiveBreakpoints.screenWidth * 0.8;
    }
    return responsiveBreakpoints.screenWidth * .4;
  }

  Widget buildAbout(
      {required ResponsiveBreakpointsData responsiveBreakpoints,
      required BuildContext context}) {
    return Container(
        alignment: Alignment.center,
        width: responsiveBreakpoints.screenWidth,
        margin: EdgeInsets.symmetric(
            horizontal: responsiveBreakpoints.screenWidth * 0.1),
        padding:
            EdgeInsets.only(bottom: responsiveBreakpoints.screenHeight * 0.1),
        child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                  constraints: const BoxConstraints(minWidth: 300),
                  width: witchBox(responsiveBreakpoints: responsiveBreakpoints),
                  child: Column(children: [
                    AutoSizeText(
                        AppLocalizations.of(context)!.aboutMeDescription1,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize:
                                responsiveBreakpoints.isMobile ? 16 : 18)),
                    const SizedBox(height: 10),
                    AutoSizeText(
                        AppLocalizations.of(context)!.aboutMeDescription2,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize:
                                responsiveBreakpoints.isMobile ? 16 : 18)),
                    /*
                    SizedBox(
                        width: 500,
                        child: Column(children: [
                          AutoSizeText(AppLocalizations.of(context)!.skills1),
                          AutoSizeText(AppLocalizations.of(context)!.skills2),
                          AutoSizeText(AppLocalizations.of(context)!.skills3),
                        ]))
                    */
                  ])),
              Lottie.network(
                  "https://lottie.host/7f87153c-96c5-4953-82d5-2ab7e47ebaa3/2y0xxjjNwT.json",
                  fit: BoxFit.contain,
                  width: 350,
                  addRepaintBoundary: true,
                  reverse: true,
                  animate: true,
                  frameRate: const FrameRate(30),
                  filterQuality: FilterQuality.none)
            ]));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    return responsiveBreakpoints.isMobile ||
            responsiveBreakpoints.screenHeight < 600
        ? SliverToBoxAdapter(
            child: buildAbout(
                responsiveBreakpoints: responsiveBreakpoints, context: context))
        : SliverFillRemaining(
            child: buildAbout(
                responsiveBreakpoints: responsiveBreakpoints,
                context: context));
  }
}
