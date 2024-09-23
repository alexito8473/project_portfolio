import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:proyect_porfolio/presentation/widgets/work/works_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../data/dataSource/menu_items.dart';
import '../../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../customWidget/title_custom.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      child: Column(
        children: [
          TitleHome(
              title: AppLocalizations.of(context)!.workExperience,
              subIcon: MenuItems.EXPERIENCE.getIcon(size: 40)),
          SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * .8,
              child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: ResponsiveBreakpoints.of(context).screenWidth * .1,
                  children: [
                    SizedBox(
                        width: 600,
                        child: Column(
                          children: [
                            Container(
                                color: Colors.transparent,
                                height: 120,
                                child: TimelineTile(
                                    axis: TimelineAxis.vertical,
                                    alignment: TimelineAlign.start,
                                    afterLineStyle: const LineStyle(
                                        color: Colors.blueAccent),
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
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveBreakpoints.of(context)
                                                      .isMobile
                                                  ? 20
                                                  : 35,
                                          color: context
                                                  .watch<AppThemeBloc>()
                                                  .state
                                                  .isDarkMode()
                                              ? Colors.white
                                              : Colors.black),
                                    ))),
                            Container(
                                height: 450,
                                color: Colors.transparent,
                                child: TimelineTile(
                                  beforeLineStyle:
                                      const LineStyle(color: Colors.blueAccent),
                                  indicatorStyle: const IndicatorStyle(
                                      color: Colors.blueAccent,
                                      width: 40,
                                      indicator:
                                          Icon(Icons.directions_boat, size: 40),
                                      padding:
                                          EdgeInsets.only(right: 30, top: 10)),
                                  isLast: true,
                                  axis: TimelineAxis.vertical,
                                  alignment: TimelineAlign.start,
                                  endChild: const Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: WorksWidget(),
                                  ),
                                ))
                          ],
                        )),
                    ClipOval(
                        child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      color: context.watch<AppThemeBloc>().state.isDarkMode()
                          ? Colors.blueGrey.withOpacity(0.4)
                          : Colors.transparent,
                      width: ResponsiveBreakpoints.of(context).isMobile
                          ? 200
                          : 300,
                      height: ResponsiveBreakpoints.of(context).isMobile
                          ? 200
                          : 300,
                      child: Lottie.network(
                          "https://lottie.host/466cb5e1-7dc8-4dfd-a0d1-4fd717a3d40c/WE4LONGJXs.json",
                          fit: BoxFit.contain,
                          addRepaintBoundary: true,
                          backgroundLoading: true,
                          reverse: true,
                          animate: true,
                          filterQuality: FilterQuality.none,
                          frameRate: FrameRate.max),
                    ))
                  ]))
        ],
      ),
    );
  }
}
