import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/contactToMe_Widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widegt.dart';
import '../widgets/listTechnology.dart';
import '../widgets/project_widget.dart';
import '../widgets/works_widget.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Widget topNavigation;
  final List<GlobalKey> listGlobalKey;
  final bool activeNavigationTop;
  final bool bannerBackground;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.topNavigation,
      required this.listGlobalKey,
      required this.activeNavigationTop,
      required this.bannerBackground});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  children: [
                    SizedBox(key: widget.listGlobalKey[0],height: 1,width: 1,),
                    const RepaintBoundary(child: HeaderWidget()),
                    SizedBox(key: widget.listGlobalKey[1],height: 1,width: 1,),
                    const RepaintBoundary(child: EducationWidget()),
                    SizedBox(key: widget.listGlobalKey[2],height: 1,width: 1,),
                    const RepaintBoundary(child: ListProject()),
                    SizedBox(key: widget.listGlobalKey[3],height: 1,width: 1,),
                    const RepaintBoundary(child: LitTechnology()),
                    SizedBox(key: widget.listGlobalKey[4],height: 1,width: 1,),
                     const RepaintBoundary(child: ContactToMeWidget()),
                    const RepaintBoundary(child: FooterWidget()),
                  ],
                ))));
  }
}
