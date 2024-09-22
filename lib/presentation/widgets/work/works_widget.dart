import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../domain/blocs/appLocale/app_locale_bloc.dart';
import '../../../domain/blocs/appTheme/app_theme_bloc.dart';

class WorksWidget extends StatelessWidget {
  const WorksWidget({super.key});

  double titleFontSize(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return 20;
    }
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return 25;
    }
    return 32;
  }

  double secondTileFontSize(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return 20;
    }
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return 25;
    }
    return 28;
  }

  double timeFontSize(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return 20;
    }
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return 25;
    }
    return 25;
  }

  double descriptionFontSize(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return 16;
    }
    return 23;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.only(
            top: ResponsiveBreakpoints.of(context).isMobile ? 0 : 80),
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: context.watch<AppThemeBloc>().state.isDarkMode()
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken)
                    : const ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: const AssetImage("assets/images/BackgroundBoat.webp"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
                scale: 1.1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(AppLocalizations.of(context)!.practices,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: titleFontSize(context),
                      color: Colors.blueAccent)),
              AutoSizeText("NextPort AI",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: secondTileFontSize(context),
                      color: Colors.blue)),
              AutoSizeText(
                  "${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 4))} - ${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 6))}",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: timeFontSize(context), color: Colors.grey)),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomLeft,
                child: AutoSizeText(
                    AppLocalizations.of(context)!.practicesNextPort,
                    style: TextStyle(
                        fontSize: descriptionFontSize(context),
                        color: Colors.white)),
              ))
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
                colorFilter: context.watch<AppThemeBloc>().state.isDarkMode()
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
