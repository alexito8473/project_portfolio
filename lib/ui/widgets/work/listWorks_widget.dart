import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/ui/widgets/work/works_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:timeline_tile/timeline_tile.dart';
import '../customWidget/titleCustom.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveBreakpoints.of(context).isMobile?ResponsiveBreakpoints.of(context).screenHeight:null,
      margin:  EdgeInsets.only(bottom: ResponsiveBreakpoints.of(context).isMobile?0:100),
      child: Column(
        children: [
          TitleHome(title: AppLocalizations.of(context)!.workExperience),
          Container(
              width: 800,
              color: Colors.transparent,
              height: ResponsiveBreakpoints.of(context).isMobile ? 150 : 360,
              margin: EdgeInsets.only(
                  left: ResponsiveBreakpoints.of(context).screenWidth * 0.15,
                  right: ResponsiveBreakpoints.of(context).screenWidth * 0.15),
              child: TimelineTile(
                  axis: TimelineAxis.vertical,
                  alignment: TimelineAlign.start,
                  afterLineStyle: const LineStyle(color: Colors.blueAccent),
                  indicatorStyle: const IndicatorStyle(
                      color: Colors.blueAccent,
                      width: 40,
                      indicator: Icon(Icons.work, size: 40),
                      padding: EdgeInsets.only(right: 30, bottom: 30, top: 10)),
                  isFirst: true,
                  endChild: const NoWorkWidget())),
          Container(
              width: 800,
              height: ResponsiveBreakpoints.of(context).isMobile ? 330 : 360,
              color: Colors.transparent,
              margin: EdgeInsets.only(
                  left: ResponsiveBreakpoints.of(context).screenWidth * 0.15,
                  right: ResponsiveBreakpoints.of(context).screenWidth * 0.15),
              child: TimelineTile(
                beforeLineStyle: const LineStyle(color: Colors.blueAccent),
                indicatorStyle: const IndicatorStyle(
                    color: Colors.blueAccent,
                    width: 40,
                    indicator: Icon(Icons.directions_boat, size: 40),
                    padding: EdgeInsets.only(right: 30, top: 10)),
                isLast: true,
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.start,
                endChild: const Padding(padding: EdgeInsets.only(top:30),child: WorksWidget(),),
              ))
        ],
      ),
    ) ;
  }
}


