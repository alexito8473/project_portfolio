import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:proyect_porfolio/presentation/widgets/customWidget/title_custom.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../data/dataSource/menu_items.dart';
import '../../../data/dataSource/project_data.dart';
import '../../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../customWidget/custom_button_widget.dart';

class ListProject extends StatefulWidget {
  const ListProject({super.key});

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.spaceBetween,
              children: [
                TitleHome(
                    title: AppLocalizations.of(context)!.projects,
                    subIcon: MenuItems.PROJECT.getIcon(size: 40),
                    haveWidth: false),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: ResponsiveBreakpoints.of(context).screenHeight *
                            0.05),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            shadowColor: Colors.greenAccent,
                            elevation: 5,
                            // Elevación
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15)),
                        onPressed: () => context.go("/projects"),
                        child: const AutoSizeText("Ver todos los proyectos",
                            style: TextStyle(fontSize: 18), maxLines: 1)))
              ]))
    ])));
  }
}

class MasonrySliver extends StatelessWidget {
  const MasonrySliver({super.key});
  int countColumns({required BuildContext context}) {
    if (ResponsiveBreakpoints.of(context).screenWidth < 770) return 1;
    if (ResponsiveBreakpoints.of(context).screenWidth < 1300) return 2;
    if (ResponsiveBreakpoints.of(context).screenWidth < 2000) return 3;
    if (ResponsiveBreakpoints.of(context).isDesktop) return 4;
    return 1;
  }

  double viewportFraction({required BuildContext context}) =>
      ResponsiveBreakpoints.of(context).isTablet
          ? 0.55
          : ResponsiveBreakpoints.of(context).isMobile
              ? 0.75
              : 0.32;

  double aspectRatio({required BuildContext context}) =>
      ResponsiveBreakpoints.of(context).isTablet
          ? 1.6
          : ResponsiveBreakpoints.of(context).isMobile
              ? 0.8
              : 2.2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    int countColum = countColumns(context: context);
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: MasonryGrid(
            crossAxisAlignment: CrossAxisAlignment.center,
            column: countColum,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: List.generate(
                4,
                (index) => Padding(
                    padding: index < countColum
                        ? EdgeInsets.only(
                            top: index == 0 ? 0 : (index % 2 + 0.5) * 70)
                        : EdgeInsets.zero,
                    child: BannerPro(
                        projectRelease: ProjectRelease.values[index]))),
          )),
    );
  }
}
class BannerPro extends StatefulWidget {
  final ProjectRelease projectRelease;
  final double height;
  const BannerPro({super.key, required this.projectRelease, this.height = 600});

  @override
  State<BannerPro> createState() => _BannerProState();
}

class _BannerProState extends State<BannerPro> {
  bool isHover = false;
  Widget bannerTitle(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
              maxLines: 1,
              widget.projectRelease.project
                  .name,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight:
                  FontWeight.bold)),

          if (widget.projectRelease.project
              .urlPage !=
              null)
            ButtonNavigation(
                uri: Uri.parse(widget
                    .projectRelease
                    .project
                    .urlPage!),
                urlSvg: "assets/svg/web.svg"),
          ButtonNavigation(
              uri: Uri.parse(widget
                  .projectRelease
                  .project
                  .repositoryUrl),
              urlSvg: "assets/svg/github.svg")
        ]
    );
  }
  Widget contentTitle(){
    return Expanded(
        child: Padding(
            padding:
            const EdgeInsets.symmetric(
                vertical: 10),
            child: AutoSizeText(
                widget.projectRelease
                    .getDescription(
                    context),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white),
                textAlign:
                TextAlign.justify)));
  }
  Widget footerTitle(){
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                widget
                    .projectRelease
                    .project
                    .imgIconLanguage
                    .length, (index) {
              return SvgPicture.asset(
                  widget
                      .projectRelease
                      .project
                      .imgIconLanguage[
                  index],
                  color: widget
                      .projectRelease
                      .project
                      .imgIconLanguage[
                  index]
                      .endsWith(
                      "github.svg")
                      ? Colors.white
                      : null,
                  width: ResponsiveBreakpoints
                      .of(context)
                      .isMobile
                      ? 35
                      : 42);
            })));
  }
  Widget animatedTop(){
    return AnimatedContainer(
        duration:
        const Duration(milliseconds: 700),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
            gradient: LinearGradient(
              begin: isHover
                  ? Alignment.topRight
                  : Alignment.topLeft,
              end: isHover
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              colors: widget.projectRelease
                  .listBackgroundNoActive()
            )),
        alignment: Alignment.bottomRight,
        height: 250,
        child: AnimatedContainer(
          duration:
          const Duration(milliseconds: 700),
          width:ResponsiveBreakpoints.of(context).isMobile?ResponsiveBreakpoints.of(context).screenWidth*0.5:  250,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                  isAntiAlias: false,
                  colorFilter: ColorFilter.mode(
                      isHover
                          ? Colors.black26
                          : Colors.black54,
                      BlendMode.darken),
                  filterQuality: FilterQuality.none,
                  image: AssetImage(widget
                      .projectRelease
                      .project
                      .imgUrl)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: isHover
                        ? Colors.black
                        .withOpacity(.8)
                        : Colors.black
                        .withOpacity(.2),
                    blurRadius: isHover ? 10 : 2,
                    spreadRadius: isHover ? 5 : 2)
              ])
        ));
  }
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: MouseRegion(
        onHover: (event) {
          if (isHover) return;
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          if (!isHover) return;
          setState(() {
            isHover = false;
          });
        },
        child: Hero(
            tag: widget.projectRelease.project.name,
            child: Material(
                color: Colors.transparent,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.watch<AppThemeBloc>().state.isDarkMode()
                            ? Colors.black
                            : Colors.grey[900],
                        boxShadow: [
                          context.watch<AppThemeBloc>().state.isDarkMode()
                              ? BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 15)
                              : BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.8),
                              blurRadius: 15)
                        ]),
                    height: widget.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          animatedTop(),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        bannerTitle(),
                                        contentTitle(),
                                        footerTitle()
                                      ])))
                        ])))))) ;
  }
}
