import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';

import '../../../l10n/app_localizations.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});


  double witchBox({required Size size}) {
    if (CalculateSize.isMobile(size)) {
      return size.width * 0.8;
    }
    if (size.width < 1000) {
      return size.width * 0.8;
    }
    return size.width * .4;
  }

  Widget buildAbout({required Size size,
      required BuildContext context}) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    bool isMobile = CalculateSize.isMobile(size);
    return Container(
        alignment: Alignment.center,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: size.width * 0.05,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                  constraints: const BoxConstraints(minWidth: 350),
                  width: witchBox(size: size),
                  child: Column(children: [
                    AutoSizeText(locale.aboutMeDescription1,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: isMobile ? 16 : 18)),
                    const SizedBox(height: 10),
                    AutoSizeText(locale.aboutMeDescription2,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: isMobile ? 16 : 18)),
                  ])),
              Container(
                width: isMobile ? size.width * 0.8 : size.width * 0.3,
                constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
                child: Lottie.network(
                    "https://lottie.host/7f87153c-96c5-4953-82d5-2ab7e47ebaa3/2y0xxjjNwT.json",
                    fit: BoxFit.contain,
                    addRepaintBoundary: true,
                    reverse: true,
                    animate: true,
                    frameRate: const FrameRate(30),
                    filterQuality: FilterQuality.none),
              )
            ]));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return CalculateSize.isMobile(size) || size.height < 600
        ? SliverToBoxAdapter(
            child: buildAbout(size: size, context: context))
        : SliverFillRemaining(
            child: buildAbout(size: size, context: context));
  }
}
