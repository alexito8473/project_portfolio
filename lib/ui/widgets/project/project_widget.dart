
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/ui/widgets/customWidget/titleCustom.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/Project.dart';
import '../../../structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../customWidget/customButton_widget.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveBreakpoints.of(context).isMobile?ResponsiveBreakpoints.of(context).screenHeight:null,
      child: Column(children: [
        TitleHome(title: AppLocalizations.of(context)!.projects),
        Container(
            padding: EdgeInsets.only(
                top: ResponsiveBreakpoints.of(context).screenHeight * 0.05),
            width: ResponsiveBreakpoints.of(context).screenWidth,
            height: 400,
            child: FlutterCarousel(
              items: List.generate(
                ProjectRelease.values.length,
                    (index) {
                  return BannerProject(
                      projectRelease: ProjectRelease.values[index]);
                },
              ),
              options: FlutterCarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: ResponsiveBreakpoints.of(context).isTablet
                      ? 0.55
                      : ResponsiveBreakpoints.of(context).isMobile
                      ? 0.75
                      : 0.32,
                  autoPlayCurve: Curves.linear,
                  showIndicator:
                  ResponsiveBreakpoints.of(context).isMobile ? true : false,
                  aspectRatio: ResponsiveBreakpoints.of(context).isTablet
                      ? 1.6
                      : ResponsiveBreakpoints.of(context).isMobile
                      ? 0.8
                      : 2.2),
            ))
      ]),
    );
  }
}
class TransparentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Define aquí las áreas no transparentes de la imagen. Ejemplo simple:
    path.addRect(Rect.fromLTWH(0, 0, size.width - 2,
        size.height)); // Ajusta las dimensiones según necesites
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BannerProject extends StatelessWidget {
  final ProjectRelease projectRelease;
  const BannerProject({super.key, required this.projectRelease});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  scale: 1.2,
              image: AssetImage(projectRelease.project.imgUrl),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.black54, BlendMode.darken),
              alignment: Alignment.topCenter,
              filterQuality: FilterQuality.none,
            )),
            child: Stack(
              children: [
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
                                  fontWeight: FontWeight.bold,
                                ))),
                        Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                            color: Colors.white24,
                                            spreadRadius: 4,
                                            blurRadius: 4)
                                      ]),
                                  child: Wrap(
                                      alignment: WrapAlignment.spaceAround,
                                      children: List.generate(
                                          projectRelease.project.imgIconLanguage
                                              .length, (index) {
                                        return SvgPicture.asset(
                                            projectRelease
                                                .project.imgIconLanguage[index],
                                            color: projectRelease.project
                                                    .imgIconLanguage[index]
                                                    .endsWith("github.svg")
                                                ? context
                                                        .watch<AppThemeBloc>()
                                                        .state
                                                        .isDarkMode()
                                                    ? Colors.white
                                                    : Colors.black
                                                : null,
                                            width: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isMobile
                                                ? 30
                                                : 45);
                                      }))),
                            ),
                            ButtonGithubProject(
                                uri: Uri.parse(
                                    projectRelease.project.repositoryUrl)),
                          ],
                        )
                      ],
                    )),
              ],
            )));
  }
}