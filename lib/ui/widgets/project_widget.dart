import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Project.dart';
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
      isMobile: true,
          )
        : BannerProjectWithImage(
            urlImage: project.imgUrl[0],
            bannerBackground: bannerBackground,
            size: size,
            project: project,
          );
  }
}

class BannerProjectWithImage extends StatelessWidget {
  final String urlImage;
  final bool bannerBackground;
  final Project project;
  final Size size;
  const BannerProjectWithImage(
      {super.key,
      required this.urlImage,
      required this.bannerBackground,
      required this.project,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: project.isApplicationMobile ? 600 : 1200,
        height: 480,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BannerProject(
            size: size,
            project: project,
            width: 300,
            height: 480, isMobile: false,
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: project.isApplicationMobile ? 0 : 20),
                  child: ClipRRect(
                      borderRadius: const  BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        urlImage,
                        height: 480,
                        alignment: project.isApplicationMobile?Alignment.center:Alignment.centerLeft,
                        fit: project.isApplicationMobile
                            ? BoxFit.contain
                            : BoxFit.cover,
                      ))))
        ]));
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
      required this.height, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      margin: !isMobile?null:EdgeInsets.only(bottom: size.height*0.1),
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
                        color: Colors.black.withOpacity(.4),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      project.imgIconLanguage.length,
                      (index) {
                        return SvgPicture.asset(
                          project.imgIconLanguage[index],
                          width: 50,
                        );
                      },
                    )),
              )),
              ButtonGithubProject(
                  size: size, uri: Uri.parse(project.repositoryUrl)),
            ],
          )
        ],
      ),
    );
  }
}
