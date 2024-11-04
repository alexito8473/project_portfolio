import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
    return SizedBox(
        height: ResponsiveBreakpoints.of(context).screenHeight,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TitleHome(
                      title: AppLocalizations.of(context)!.projects,
                      subIcon: MenuItems.PROJECT.getIcon(size: 40),
                      haveWidth: false,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shadowColor: Colors.greenAccent,
                          elevation: 5,
                          // Elevación
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                        onPressed: () => context.go("/projects"),
                        child: const AutoSizeText("Ver todos los proyectos",
                            style: TextStyle(fontSize: 18), maxLines: 1))
                  ])),
          Container(
              padding: EdgeInsets.only(
                  top: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
              width: ResponsiveBreakpoints.of(context).screenWidth,
              height: 420,
              child: FlutterCarousel(
                  items: List.generate(
                      4,
                      (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: BannerProject(
                              projectRelease: ProjectRelease.values[index]))),
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
  final double? height;
  const BannerProject({super.key, required this.projectRelease, this.height});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      height: height,
      duration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(maxHeight: 700),
      margin: EdgeInsets.only(
          bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
                color: context.watch<AppThemeBloc>().state.isDarkMode()
                    ? Colors.white24
                    : Colors.black87,
                spreadRadius: 2,
                blurRadius: 10),
          ],
          image: DecorationImage(
              scale: 1.2,
              image: AssetImage(projectRelease.project.imgUrl),
              fit: BoxFit.cover,
              colorFilter: context.watch<AppThemeBloc>().state.isDarkMode()
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken)
                  : const ColorFilter.mode(Colors.black54, BlendMode.darken),
              alignment: Alignment.topCenter,
              filterQuality: FilterQuality.none)),
      child: Stack(children: [
        Padding(
            padding: const EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AutoSizeText(
                  maxLines: 1,
                  projectRelease.project.name,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: [
                    if (projectRelease.project.urlPage != null)
                      ButtonNavigation(
                          uri: Uri.parse(projectRelease.project.urlPage!),
                          urlSvg: "assets/svg/web.svg"),
                    ButtonNavigation(
                        uri: Uri.parse(projectRelease.project.repositoryUrl),
                        urlSvg: "assets/svg/github.svg")
                  ])),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AutoSizeText(
                          projectRelease.getDescription(context),
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.justify))),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(1),
                  child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: List.generate(
                          projectRelease.project.imgIconLanguage.length,
                          (index) {
                        return SvgPicture.asset(
                            projectRelease.project.imgIconLanguage[index],
                            color: projectRelease.project.imgIconLanguage[index]
                                    .endsWith("github.svg")
                                ?  Colors.white

                                : null,
                            width: ResponsiveBreakpoints.of(context).isMobile
                                ? 35
                                : 42);
                      }))),
            ]))
      ]));
}
