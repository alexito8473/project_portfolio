import 'package:animate_do/animate_do.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../domain/blocs/appCheckVisibilityNavigationTop/app_check_visibility_navigation_top_bloc.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final UpdateNavigationEvent updateNavigationEvent;
  final Widget topNavigation;
  final List<Widget> listWidgetHome;

  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.updateNavigationEvent,
      required this.listWidgetHome});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() => context
        .read<AppCheckVisibilityNavigationTopBloc>()
        .add(widget.updateNavigationEvent));
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() => context
        .read<AppCheckVisibilityNavigationTopBloc>()
        .add(widget.updateNavigationEvent));
    widget.scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          flexibleSpace: widget.topNavigation,
          shadowColor: context.watch<AppThemeBloc>().state.isDarkMode()
              ? Colors.grey
              : Colors.black,
          toolbarHeight: ResponsiveBreakpoints.of(context).isMobile ? 65 : 80),
      body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              paint: Paint(),
              options: ParticleOptions(
                  baseColor: Colors.blue,
                  opacityChangeRate: 0.30,
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
          child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                  children: List.generate(widget.listWidgetHome.length,
                      (index) => RepaintBoundary(child: FadeIn(child: widget.listWidgetHome[index])))))));
}
