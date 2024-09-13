import 'package:animate_do/animate_do.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Function checkIfWidgetIsVisible;
  final Widget topNavigation;
  final List<Widget> listWidgetHome;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.checkIfWidgetIsVisible,
      required this.listWidgetHome});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() => widget.checkIfWidgetIsVisible());
  }

  @override
  void dispose() {
    widget.scrollController
        .removeListener(() => widget.checkIfWidgetIsVisible());
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          flexibleSpace: widget.topNavigation,
          shadowColor: context.watch<AppThemeBloc>().state.isDarkMode()
              ? Colors.grey
              : Colors.black,
          toolbarHeight: 70,
        ),
        body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
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
                    particleCount: ResponsiveBreakpoints.of(context).isMobile?6: 10)),
            vsync: this,
            child: SingleChildScrollView(
                controller: widget.scrollController,
                child: RepaintBoundary(
                    child: Column(
                        children: List.generate(
                            widget.listWidgetHome.length,
                            (index) => FadeIn(
                                child: widget.listWidgetHome[index])))))));
  }
}
