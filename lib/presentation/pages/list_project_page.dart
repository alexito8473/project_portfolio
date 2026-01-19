import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';

import '../../data/dataSource/project_data.dart';
import '../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/project/project_widget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final bool isMobile = CalculateSize.isMobile(size);
    return BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
      return Scaffold(
          body: Stack(children: [
        Positioned.fill(
            child: AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                    paint: Paint(),
                    options: ParticleOptions(
                        baseColor: Colors.green,
                        opacityChangeRate: 0.25,
                        minOpacity: state.appTheme.isDarkMode() ? 0.11 : 0.08,
                        maxOpacity: state.appTheme.isDarkMode() ? 0.45 : 0.13,
                        spawnMinSpeed: 20.0,
                        spawnMaxSpeed: 30.0,
                        spawnMinRadius: 7.0,
                        spawnMaxRadius: 30.0,
                        particleCount: isMobile ? 6
                                : 10)),
                vsync: this,
                child: MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500),
                    addRepaintBoundaries: true,
                    itemCount: ProjectRelease.values.length,
                    mainAxisSpacing: size.height * 0.01,
                    crossAxisSpacing: size.width * 0.01,
                    padding: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.08,
                        top: size.height * 0.15),
                    itemBuilder: (context, index) {
                      return BannerPro(
                          projectRelease: ProjectRelease.values[index],
                          height: isMobile ? 700
                              : (index % 2 + 4) * 130);
                    }))),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
                learning: Row(children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined))
                ]),
                changeScroll: null,
                changeTop: true,
                onDoubleTap: () {},
                canNotTapButton: false))
      ]));
    });
  }
}
