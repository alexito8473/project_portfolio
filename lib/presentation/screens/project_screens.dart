
import 'package:animated_background/animated_background.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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

class ProjectScreens extends StatefulWidget {
  const ProjectScreens({super.key});

  @override
  State<ProjectScreens> createState() => _ProjectScreensState();
}

class _ProjectScreensState extends State<ProjectScreens>
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
        appBar: AppBar(
            title: AutoSizeText(AppLocalizations.of(context)!.projects,
                style: const TextStyle(fontSize: 28), maxLines: 1),
            actions: [
              IconButton(
                  onPressed: () =>
                      context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
                  icon: Text(
                      BlocProvider.of<AppLocaleBloc>(context)
                          .state
                          .locale
                          .getLenguajeCode(),
                      style: const TextStyle(fontSize: 25))),
              Padding(
                  padding: EdgeInsets.only(
                    right: ResponsiveBreakpoints.of(context).screenWidth * 0.05,
                  ),
                  child: IconButton(
                      onPressed: () =>
                          context.read<AppThemeBloc>().add(ChangeThemeEvent()),
                      icon: BlocProvider.of<AppThemeBloc>(context)
                          .state
                          .appTheme
                          .getIcon()))
            ],
            flexibleSpace:
                context.watch<AppBannerTopBloc>().state.isActiveBannerTop &&
                        !ResponsiveBreakpoints.of(context).isMobile
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                ResponsiveBreakpoints.of(context).screenWidth *
                                    0.035),
                        child: const Center(child: HeaderTop()))
                    : null,
            shadowColor: context.watch<AppThemeBloc>().state.isDarkMode()
                ? Colors.grey
                : Colors.black,
            toolbarHeight:
                ResponsiveBreakpoints.of(context).isMobile ? 65 : 80),
        body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                paint: Paint(),
                options: ParticleOptions(
                    baseColor: Colors.green,
                    opacityChangeRate: 0.25,
                    minOpacity: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? 0.11
                        : 0.08,
                    maxOpacity: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? 0.45
                        : 0.13,
                    spawnMinSpeed: 20.0,
                    spawnMaxSpeed: 30.0,
                    spawnMinRadius: 7.0,
                    spawnMaxRadius: 30.0,
                    particleCount:
                        ResponsiveBreakpoints.of(context).isMobile ? 6 : 10)),
            vsync: this,
            child: MasonryGridView.count(
                crossAxisCount: countColumns(),
                addRepaintBoundaries: true,
                mainAxisSpacing: ResponsiveBreakpoints.of(context).screenHeight * 0.01,
                crossAxisSpacing: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
                padding: EdgeInsets.only(left: ResponsiveBreakpoints.of(context).screenWidth * 0.08, right: ResponsiveBreakpoints.of(context).screenWidth * 0.08, top: ResponsiveBreakpoints.of(context).screenHeight * 0.1),
                itemCount: ProjectRelease.values.length,
                itemBuilder: (context, index) {
                  return BannerProject(
                      projectRelease: ProjectRelease.values[index],
                      height: ResponsiveBreakpoints.of(context).isMobile
                          ? 400
                          : (index % 5 + 3) * 100);
                })));
  }
}
