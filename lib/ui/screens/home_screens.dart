import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Project.dart';
import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/header_widegt.dart';
import '../widgets/listTechnology.dart';
import '../widgets/project_widget.dart';
import '../widgets/titleCustom.dart';
import '../widgets/works_widget.dart';

class HomeScreen extends StatefulWidget {
  final Function createDialogTechnology;
  final ScrollController scrollController;
  final Widget topNavigation;
  final List<GlobalKey> listGlobalKey;
  final bool activeNavigationTop;
  final Size size;
  final bool isMobile;
  final bool bannerBackground;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.listGlobalKey,
      required this.activeNavigationTop,
      required this.size,
      required this.createDialogTechnology,
      required this.bannerBackground,
      required this.isMobile});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: widget.topNavigation,
          shadowColor: isDarkMode ? Colors.grey : Colors.black,
          toolbarHeight: 70,
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
              particleCount: widget.isMobile ? 7 : 15,
            )),
            vsync: this,
            child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Column(
                  children: [
                    HeaderWidget(
                      key: widget.listGlobalKey[0],
                      size: widget.size,
                      isMobile: widget.isMobile,
                    ),
                    EducationWidget(
                      key: widget.listGlobalKey[1],
                      size: widget.size,
                      isMobile: widget.isMobile,
                    ),
                    TitleHome(
                        key: widget.listGlobalKey[2],
                        size: widget.size,
                        title: AppLocalizations.of(context)!.projects,
                        isMobile: widget.isMobile),
                    RepaintBoundary(
                        child: Padding(
                      padding: EdgeInsets.only(
                          top: widget.size.height * 0.05,
                          left: widget.size.width * 0.05,
                          right: widget.size.width * 0.05),
                      child: Wrap(
                        spacing: 40,
                        runSpacing:
                            widget.isMobile ? 35 : widget.size.height * .07,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          ProjectRelease.values.length,
                          (index) {
                            return BannerProject(
                              size: widget.size,
                              projectRelease: ProjectRelease.values[index],
                              isMobile: widget.isMobile,
                              isDarkMode: isDarkMode,
                            ).increaseSizeOnHover(1.05);
                          },
                        ),
                      ),
                    )),
                    LitTechnology(
                      key: widget.listGlobalKey[3],
                      size: widget.size,
                      isMobile: widget.isMobile,
                      createDialogTechnology: widget.createDialogTechnology,
                    ),
                    EducationWidget(
                      key: widget.listGlobalKey[4],
                      size: widget.size,
                      isMobile: widget.isMobile,
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
