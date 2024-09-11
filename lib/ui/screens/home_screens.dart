import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/aboutMe_widget.dart';
import '../widgets/contactToMe_Widget.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Widget topNavigation;
  final Widget listTechnology;
  final Widget listProject;
  final Widget header;
  final Widget educationWidget;
  final List<GlobalKey> listGlobalKey;
  final Function checkIfWidgetIsVisible;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.listGlobalKey,
      required this.listTechnology,
      required this.listProject,
      required this.header,
      required this.checkIfWidgetIsVisible, required this.educationWidget});

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
              particleCount: 10,
            )),
            vsync: this,
            child: SingleChildScrollView(
                controller: widget.scrollController,
                child: RepaintBoundary(
                    child: Column(
                  children: [
                    SizedBox(key: widget.listGlobalKey[0]),
                    widget.header,
                    const AboutMeWidget(),
                    SizedBox(key: widget.listGlobalKey[1]),
                    widget.educationWidget,
                    SizedBox(key: widget.listGlobalKey[2]),
                    widget.listProject,
                    SizedBox(key: widget.listGlobalKey[3]),
                    widget.listTechnology,
                    SizedBox(key: widget.listGlobalKey[4]),
                    const ContactToMeWidget(),
                    const FooterWidget(),
                  ],
                )))));
  }
}
