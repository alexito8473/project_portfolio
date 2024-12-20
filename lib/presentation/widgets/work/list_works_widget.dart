import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:proyect_porfolio/presentation/widgets/work/works_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../domain/cubits/appTheme/app_theme_cubit.dart';

class WorkWidget extends StatelessWidget {
  const WorkWidget({super.key});
  Widget createListWork(
      {required ResponsiveBreakpointsData responsiveBreakpoints,
      required BuildContext context}) {
    return Container(
        alignment: Alignment.center,
        child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: responsiveBreakpoints.screenWidth * .08,
            children: [
              Container(
                  constraints: const BoxConstraints(minWidth: 800),
                  width: responsiveBreakpoints.screenWidth * 0.5,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  responsiveBreakpoints.screenWidth * 0.1),
                          color: Colors.transparent,
                          height: 120,
                          child: TimelineTile(
                              axis: TimelineAxis.vertical,
                              alignment: TimelineAlign.start,
                              afterLineStyle:
                                  const LineStyle(color: Colors.blueAccent),
                              indicatorStyle: const IndicatorStyle(
                                  color: Colors.blueAccent,
                                  width: 40,
                                  indicator: Icon(Icons.work, size: 40),
                                  padding: EdgeInsets.only(
                                      right: 30, bottom: 30, top: 10)),
                              isFirst: true,
                              endChild: AutoSizeText(
                                AppLocalizations.of(context)!.comingSoon,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontSize: responsiveBreakpoints.isMobile
                                            ? 20
                                            : 35,
                                        color: context
                                                .watch<AppThemeCubit>()
                                                .state
                                                .isDarkMode()
                                            ? Colors.white
                                            : Colors.black),
                              ))),
                      Container(
                          height: 500,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  responsiveBreakpoints.screenWidth * 0.1),
                          color: Colors.transparent,
                          child: TimelineTile(
                              beforeLineStyle:
                                  const LineStyle(color: Colors.blueAccent),
                              indicatorStyle: const IndicatorStyle(
                                  color: Colors.blueAccent,
                                  width: 40,
                                  indicator:
                                      Icon(Icons.directions_boat, size: 40),
                                  padding: EdgeInsets.only(right: 30, top: 10)),
                              isLast: true,
                              axis: TimelineAxis.vertical,
                              alignment: TimelineAlign.start,
                              endChild: const Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: WorksWidget())))
                    ],
                  )),
              Lottie.network(
                  "https://lottie.host/f6217d7d-3b90-47fb-b522-d31ee895ff63/1PBguv1ZIv.json",
                  fit: BoxFit.contain,
                  width: responsiveBreakpoints.isMobile ? 200 : 300,
                  height: responsiveBreakpoints.isMobile ? 200 : 300,
                  addRepaintBoundary: true,
                  backgroundLoading: true,
                  reverse: true,
                  animate: true,
                  frameRate: const FrameRate(27),
                  filterQuality: FilterQuality.none)
            ]));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    return responsiveBreakpoints.screenWidth < 1200 ||
            responsiveBreakpoints.screenHeight < 600
        ? SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: responsiveBreakpoints.screenHeight * 0.3),
                child: createListWork(
                    responsiveBreakpoints: responsiveBreakpoints,
                    context: context)),
          )
        : SliverFillRemaining(
            child: createListWork(
                responsiveBreakpoints: responsiveBreakpoints,
                context: context));
  }
}
