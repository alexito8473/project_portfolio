import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'customWidget/titleCustom.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
        child: Column(
          children: [
            TitleHome(title: AppLocalizations.of(context)!.workExperience),
            Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    top: ResponsiveBreakpoints.of(context).isMobile ? 0 : 80),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                        image: const AssetImage(
                            "assets/images/BackgroundBoat.webp"),
                        fit: BoxFit.none,
                        filterQuality: FilterQuality.high,
                        scale: 1.1),
                    borderRadius: BorderRadius.circular(20)),
                width: ResponsiveBreakpoints.of(context).screenWidth * .7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: ResponsiveBreakpoints.of(context).screenWidth *
                              .7,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              AutoSizeText(
                                  AppLocalizations.of(context)!.practices,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 45, color: Colors.blueAccent)),
                              AutoSizeText("NextPort AI",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .isMobile
                                              ? 20
                                              : 35,
                                      color: Colors.lightBlue)),
                            ],
                          )),
                      AutoSizeText(
                          "${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 4))} - ${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 6))}",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isMobile
                                      ? 20
                                      : 35,
                              color: Colors.grey)),
                      const SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                          AppLocalizations.of(context)!.practicesNextPort,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isMobile
                                      ? 17
                                      : 23,
                              color: Colors.white)),
                    ]))
          ],
        ));
  }
}
