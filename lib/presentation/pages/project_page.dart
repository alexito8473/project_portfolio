import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../data/dataSource/project_data.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
import '../../domain/blocs/appLocale/app_locale_bloc.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/project/project_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../data/dataSource/project_data.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/project/project_widget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  int countColumns() {
    if (ResponsiveBreakpoints.of(context).screenWidth < 650) return 1;
    if (ResponsiveBreakpoints.of(context).screenWidth < 1300) return 2;
    if (ResponsiveBreakpoints.of(context).screenWidth < 1800) return 3;
    if (ResponsiveBreakpoints.of(context).isDesktop) return 4;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: AnimatedBackground(
                    behaviour: RandomParticleBehaviour(
                        paint: Paint(),
                        options: ParticleOptions(
                            baseColor: Colors.green,
                            opacityChangeRate: 0.25,
                            minOpacity:
                                context.watch<AppThemeBloc>().state.isDarkMode()
                                    ? 0.11
                                    : 0.08,
                            maxOpacity:
                                context.watch<AppThemeBloc>().state.isDarkMode()
                                    ? 0.45
                                    : 0.13,
                            spawnMinSpeed: 20.0,
                            spawnMaxSpeed: 30.0,
                            spawnMinRadius: 7.0,
                            spawnMaxRadius: 30.0,
                            particleCount:
                                ResponsiveBreakpoints.of(context).isMobile
                                    ? 6
                                    : 10)),
                    vsync: this,
                    child: MasonryGridView.builder(
                        gridDelegate:
                            const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 600),
                        addRepaintBoundaries: true,
                        itemCount: ProjectRelease.values.length,
                        mainAxisSpacing:
                            ResponsiveBreakpoints.of(context).screenHeight *
                                0.01,
                        crossAxisSpacing:
                            ResponsiveBreakpoints.of(context).screenWidth *
                                0.01,
                        padding: EdgeInsets.only(
                            left: ResponsiveBreakpoints.of(context).screenWidth *
                                0.08,
                            right: ResponsiveBreakpoints.of(context).screenWidth *
                                0.08,
                            top: ResponsiveBreakpoints.of(context).screenHeight * 0.1),
                        itemBuilder: (context, index) {
                          return BannerPro(
                              projectRelease: ProjectRelease.values[index],
                              height: ResponsiveBreakpoints.of(context).isMobile
                                  ? 700
                                  : (index % 2 + 4) * 130);
                        }))),
            Positioned(
                top: 0,
                left: 0,
                child: CustomAppBar(
                    learning: Row(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios_new_outlined))
                      ],
                    ),
                    changeScroll: null,
                    changeTop: true))
          ],
        ));
  }
}
