import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
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
  double viewportFraction() => ResponsiveBreakpoints.of(context).isTablet
      ? 0.55
      : ResponsiveBreakpoints.of(context).isMobile
          ? 0.75
          : 0.32;

  double aspectRatio() => ResponsiveBreakpoints.of(context).isTablet
      ? 1.6
      : ResponsiveBreakpoints.of(context).isMobile
          ? 0.8
          : 2.2;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ResponsiveBreakpoints.of(context).screenHeight,
        constraints: const BoxConstraints(minHeight: 600),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TitleHome(
              title: AppLocalizations.of(context)!.projects,
              subIcon: MenuItems.PROJECT.getIcon(size: 40)),
          Container(
              padding: EdgeInsets.only(
                  top: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
              width: ResponsiveBreakpoints.of(context).screenWidth,
              height: 420,
              child: FlutterCarousel(
                  items: List.generate(
                      ProjectRelease.values.length,
                      (index) => BannerProject(
                          projectRelease: ProjectRelease.values[index])),
                  options: FlutterCarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      showIndicator: false,
                      viewportFraction: viewportFraction(),
                      aspectRatio: aspectRatio()))),
        ]));
  }
}

class BannerProject extends StatelessWidget {
  final ProjectRelease projectRelease;

  const BannerProject({super.key, required this.projectRelease});

  @override
  Widget build(BuildContext context) => RepaintBoundary(
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                  scale: 1.2,
                  image: AssetImage(projectRelease.project.imgUrl),
                  fit: BoxFit.cover,
                  colorFilter: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken)
                      : const ColorFilter.mode(
                          Colors.black54, BlendMode.darken),
                  alignment: Alignment.topCenter,
                  filterQuality: FilterQuality.none)),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 50,
                          child: AutoSizeText(
                              maxLines: 1,
                              projectRelease.project.name,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AutoSizeText(
                                  projectRelease.getDescription(context),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textAlign: TextAlign.justify))),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.white12,
                                              spreadRadius: 4,
                                              blurRadius: 4)
                                        ]),
                                    child: Wrap(
                                        alignment: WrapAlignment.spaceAround,
                                        children: List.generate(
                                            projectRelease
                                                .project
                                                .imgIconLanguage
                                                .length, (index) {
                                          return SvgPicture.asset(
                                              projectRelease.project
                                                  .imgIconLanguage[index],
                                              theme: projectRelease.project
                                                      .imgIconLanguage[index]
                                                      .endsWith("github.svg")
                                                  ? SvgTheme(
                                                      currentColor: context
                                                              .watch<
                                                                  AppThemeBloc>()
                                                              .state
                                                              .isDarkMode()
                                                          ? Colors.white
                                                          : Colors.black)
                                                  : null,
                                              width: ResponsiveBreakpoints.of(
                                                          context)
                                                      .isMobile
                                                  ? 30
                                                  : 45);
                                        })))),
                            ButtonGithubProject(
                                uri: Uri.parse(
                                    projectRelease.project.repositoryUrl)),
                          ])
                    ]))
          ])));
}
