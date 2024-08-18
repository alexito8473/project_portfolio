import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../models/Project.dart';
import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import 'customButton_widget.dart';

class ProjectWidget extends StatelessWidget {
  final Size size;
  final Project project;
  final bool changeBanner;
  final bool isMobile;
  final bool isLtr;
  final bool bannerBackground;
  const ProjectWidget(
      {super.key,
      required this.size,
      required this.project,
      required this.changeBanner,
      required this.isMobile,
      required this.bannerBackground,
      required this.isLtr});
  @override
  Widget build(BuildContext context) {
    return bannerBackground
        ? BannerProject(
            size: size,
            project: project,
            width: 300,
            height: 480,
            isMobile: true)
        : BannerProjectDesktop(
            size: size,
            project: project,
            isMobile: false,
          );
  }
}

class BannerProject extends StatelessWidget {
  final Size size;
  final Project project;
  final double width;
  final double height;
  final bool isMobile;
  const BannerProject(
      {super.key,
      required this.size,
      required this.project,
      required this.width,
      required this.height,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(project.imgUrl[0]),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.hardLight),
            filterQuality: FilterQuality.low,
            alignment: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(20)),
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      margin: !isMobile ? null : EdgeInsets.only(bottom: size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: AutoSizeText(
              maxLines: 1,
              project.name,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              project.projectDescription.getDescription(context),
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(.2),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              project.imgIconLanguage.length, (index) {
                            return SvgPicture.asset(
                                project.imgIconLanguage[index],
                                width: 38);
                          })))),
              ButtonGithubProject(
                  size: size, uri: Uri.parse(project.repositoryUrl)),
            ],
          )
        ],
      ),
    );
  }
}

class BannerProjectDesktop extends StatefulWidget {
  final Size size;
  final Project project;
  final bool isMobile;
  const BannerProjectDesktop(
      {super.key,
      required this.size,
      required this.project,
      required this.isMobile});

  @override
  State<BannerProjectDesktop> createState() => _BannerProjectDesktopState();
}

class _BannerProjectDesktopState extends State<BannerProjectDesktop> {
  bool changeBackground = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            changeBackground = true;
          });
        },
        onExit: (_) {
          setState(() {
            changeBackground = false;
          });
        },
        child: SizedBox(
            width: 350,
            height: 500,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.project.imgUrl[0]),
                        fit: BoxFit.cover,
                        colorFilter: changeBackground
                            ? null
                            : ColorFilter.mode(Colors.black.withOpacity(0.7),
                                BlendMode.darken),
                        filterQuality: FilterQuality.low,
                        alignment: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  width: 350,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: AutoSizeText(
                          maxLines: 1,
                          widget.project.name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          widget.project.projectDescription
                              .getDescription(context),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: context
                                                  .watch<AppThemeBloc>()
                                                  .state
                                                  .isDarkMode()
                                              ? Colors.white.withOpacity(.1)
                                              : Colors.black.withOpacity(.4),
                                          blurRadius: 2,
                                          spreadRadius: 2)
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: List.generate(
                                          widget.project.imgIconLanguage.length,
                                          (index) {
                                        return SvgPicture.asset(
                                            widget
                                                .project.imgIconLanguage[index],
                                            width: 50);
                                      })))),
                          ButtonGithubProject(
                              size: widget.size,
                              uri: Uri.parse(widget.project.repositoryUrl)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
