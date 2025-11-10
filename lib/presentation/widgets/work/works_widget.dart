import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyect_porfolio/domain/cubits/appLocale/app_locale_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../data/models/work.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../../../l10n/app_localizations.dart';

class WorksWidget extends StatelessWidget {
  final Work work;

  const WorksWidget({super.key, required this.work});

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
    return 25;
  }

  double descriptionFontSize(
      {required ResponsiveBreakpointsData responsiveBreakpoints}) {
    if (responsiveBreakpoints.isMobile) {
      return 18;
    }
    if (responsiveBreakpoints.isTablet) {
      return 20;
    }
    return 23;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    String stringLocal =
        context.watch<AppLocaleCubit>().state.locale.getLocal().toString();
    return Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                  "${DateFormat("MMMM yyyy", stringLocal).format(work.initDay)} - ${work.finishDay == null ? "Actualidad" : DateFormat("MMMM yyyy", stringLocal).format(work.finishDay!)}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: timeFontSize(
                          responsiveBreakpoints: responsiveBreakpoints))),
              AutoSizeText(work.workData.getTitle(locale: locale),
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: titleFontSize(
                          responsiveBreakpoints: responsiveBreakpoints),
                      color: Colors.blueAccent)),
              AutoSizeText(work.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: secondTileFontSize(
                          responsiveBreakpoints: responsiveBreakpoints),
                      color: Colors.greenAccent)),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: work.workData
                              .getListWork(locale: locale)
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
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: context
                        .watch<AppThemeCubit>()
                        .state
                        .appTheme
                        .isDarkMode()
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken)
                    : const ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: const AssetImage("assets/images/NoWork.webp"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
                scale: 1.1),
            borderRadius: BorderRadius.circular(20)),
        child: AutoSizeText(
          locale.comingSoon,
          maxLines: 1,
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ));
  }
}
