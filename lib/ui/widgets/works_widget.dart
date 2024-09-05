import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'titleCustom.dart';

class EducationWidget extends StatelessWidget {
  final Size size;
  final bool isMobile;
  const EducationWidget(
      {super.key, required this.size, required this.isMobile});

  @override
  Widget build(BuildContext context) {

    return RepaintBoundary(
        child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
            child: Column(
              children: [
                TitleHome(
                  size: size,
                  title: AppLocalizations.of(context)!.workExperience,
                  isMobile: isMobile,
                ),
                Padding(
                    padding: EdgeInsets.only(top: isMobile ? 0 : 80),
                    child: Column(
                      children: [
                        TimelineTile(
                            isFirst: true,
                            indicatorStyle: const IndicatorStyle(
                                color: Colors.blueAccent, width: 25),
                            afterLineStyle:
                                const LineStyle(color: Colors.blueAccent),
                            alignment: TimelineAlign.manual,
                            lineXY: 0.2,
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: SizedBox(
                                  width: size.width,
                                  height: 60,
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)!.comingSoon,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: isMobile ? 28 : 35))),
                            )),
                        TimelineTile(
                            isLast: true,
                            indicatorStyle: const IndicatorStyle(
                                color: Colors.blueAccent, width: 25),
                            beforeLineStyle:
                                const LineStyle(color: Colors.blueAccent),
                            alignment: TimelineAlign.manual,
                            lineXY: 0.2,
                            endChild: Padding(
                                padding: EdgeInsets.only(
                                  top: isMobile ? 200 : size.height * .4,
                                  left: 30,
                                  right: 20,
                                ),
                                child: SizedBox(
                                  width: size.width,
                                  height: isMobile ? 360 : 600,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                          "${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 4))} - ${DateFormat("MMMM yyyy", context.watch<AppLocaleBloc>().state.locale.getLocal().toString()).format(DateTime.utc(2024, 6))}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: isMobile ? 20 : 35,
                                              color: Colors.grey)),
                                      AutoSizeText(
                                          AppLocalizations.of(context)!
                                              .practices,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 45,
                                              color: Colors.blueAccent)),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: AutoSizeText("NextPort AI",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: isMobile ? 20 : 40,
                                                  color: Colors.blueGrey))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .practicesNextPort,
                                            style: TextStyle(
                                                fontSize: isMobile ? 17 : 23)),
                                      )
                                    ],
                                  ),
                                )))
                      ],
                    ) /* BubbleTimeline(
                  bubbleSize: !isMobile ? 150 : 100,
                  items: [
                    TimelineItem(
                      title: AppLocalizations.of(context)!.comingSoon,
                      icon: Icon(
                        Icons.computer,
                        color: Colors.black,
                        size: iconSize,
                      ),
                      bubbleColor: Colors.red,
                      titleStyle: TextStyle(
                          fontSize: !isMobile ? 25.0 : 17.0,
                          fontWeight: FontWeight.w700),
                    ),
                    TimelineItem(
                      title: 'NextPort AI',
                      subtitle: AppLocalizations.of(context)!.practices,
                      icon: Icon(
                        Icons.directions_boat,
                        color: Colors.black,
                        size: iconSize,
                      ),
                      bubbleColor: Colors.green,
                      titleStyle: TextStyle(
                          fontSize: !isMobile ? 25.0 : 17.0,
                          fontWeight: FontWeight.w700),
                      subtitleStyle: TextStyle(
                          fontSize: !isMobile ? 16.0 : 10.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                  stripColor: Colors.teal,
                  dividerCircleColor: Colors.white,
                )*/
                    )
              ],
            )));
  }
}
