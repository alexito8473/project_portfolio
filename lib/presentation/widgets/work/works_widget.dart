import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:proyect_porfolio/domain/cubits/appLocale/app_locale_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';

class WorksWidget extends StatelessWidget {
  const WorksWidget({super.key});

  double titleFontSize(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return 20;
    }
    if (responsiveBreakpoints.isTablet) {
      return 25;
    }
    return 32;
  }

  double secondTileFontSize(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return 20;
    }
    if (responsiveBreakpoints.isTablet) {
      return 25;
    }
    return 28;
  }

  double timeFontSize(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return 20;
    }
    if (responsiveBreakpoints.isTablet) {
      return 25;
    }
    return 25;
  }

  double descriptionFontSize(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return 18;
    }
    return 23;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);

    String stringLocal=context.watch<AppLocaleCubit>().state.locale.getLocal().toString();
    return Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                  "${DateFormat("MMMM yyyy", stringLocal).format(DateTime.utc(2024, 4))} - ${DateFormat("MMMM yyyy", stringLocal).format(DateTime.utc(2024, 6))}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: timeFontSize(
                          responsiveBreakpoints: responsiveBreakpoints))),
              AutoSizeText(AppLocalizations.of(context)!.practices,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: titleFontSize(
                          responsiveBreakpoints: responsiveBreakpoints),
                      color: Colors.blueAccent)),
              AutoSizeText("NextPort AI",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: secondTileFontSize(
                          responsiveBreakpoints: responsiveBreakpoints),
                      color: Colors.blue)),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLocalizations.of(context)!.practicesNextPort1,
                            AppLocalizations.of(context)!.practicesNextPort2,
                            AppLocalizations.of(context)!.practicesNextPort3,
                          ]
                              .map((message) => AutoSizeText(message,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          fontSize: descriptionFontSize(
                                              responsiveBreakpoints:
                                                  responsiveBreakpoints))))
                              .toList())))
            ]));
  }
}

class NoWorkWidget extends StatelessWidget {
  const NoWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: context.watch<AppThemeCubit>().state.isDarkMode()
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken)
                    : const ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: const AssetImage("assets/images/NoWork.webp"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
                scale: 1.1),
            borderRadius: BorderRadius.circular(20)),
        child: AutoSizeText(
          AppLocalizations.of(context)!.comingSoon,
          maxLines: 1,
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ));
  }
}
