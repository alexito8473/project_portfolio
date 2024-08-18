import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/models/Project.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/header_widegts.dart';
import '../widgets/listProject.dart';
import '../widgets/listTechnology.dart';
import '../widgets/works_widget.dart';

class HomeDesktopScreens extends StatefulWidget {
  final Function createDialogTechnology;
  final ScrollController scrollController;
  final Widget topNavigation;
  final List<GlobalKey> listGlobalKey;
  final List<Project> listProject;
  final bool activeNavigationTop;
  final Size size;
  final bool bannerBackground;
  const HomeDesktopScreens(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.listGlobalKey,
      required this.activeNavigationTop,
      required this.size,
      required this.createDialogTechnology,
      required this.listProject,
      required this.bannerBackground});

  @override
  State<HomeDesktopScreens> createState() => _HomeDesktopScreensState();
}

class _HomeDesktopScreensState extends State<HomeDesktopScreens>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return Scaffold(
        appBar:AppBar(
          flexibleSpace: widget.topNavigation,
          shadowColor: Colors.black,
          toolbarHeight: 90,
        ),
        body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
              baseColor: Colors.blue,
              opacityChangeRate: 0.30,
              minOpacity: isDarkMode ? 0.11 : 0.08,
              maxOpacity: isDarkMode ? 0.45 : 0.13,
              spawnMinSpeed: 20.0,
              spawnMaxSpeed: 30.0,
              spawnMinRadius: 7.0,
              spawnMaxRadius: 30.0,
              particleCount: 15,
            )),
            vsync: this,
            child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Column(
                  children: [
                    HeaderWidget(
                      key: widget.listGlobalKey[0],
                      size: widget.size,
                      isMobile: false,
                    ),
                    EducationWidget(
                      key: widget.listGlobalKey[1],
                      size: widget.size,
                      isMobile: false,
                    ),
                    ListProject(
                        key: widget.listGlobalKey[2],
                        size: widget.size,
                        listProject: widget.listProject,
                        isTopNavigation: widget.activeNavigationTop,
                        isMobile: false,
                        bannerBackground: widget.bannerBackground),
                    LitTechnology(
                      key: widget.listGlobalKey[3],
                      size: widget.size,
                      isMobile: false,
                      createDialogTechnology: widget.createDialogTechnology,
                    ),
                    EducationWidget(
                      key: widget.listGlobalKey[4],
                      size: widget.size,
                      isMobile: false,
                    ),
                    Container(
                      color: Colors.grey.shade700,
                      margin: const EdgeInsets.only(top: 80),
                      height: 100,
                    ),
                  ],
                ))));
  }
}
