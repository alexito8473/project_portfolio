import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Project.dart';

class ContainerProjectWidget extends StatelessWidget {
  final Size size;
  final Project project;
  final bool changeBanner;
  final bool isMobile;
  final bool isLtr;
  final bool bannerBackground;
  const ContainerProjectWidget(
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
        ? ProjectWidget(
            bannerBackground: bannerBackground,
            listUrlIcon: project.imgIconLanguage,
            size: size,
            title: project.name,
            description: project.description,
          )
        : ProjectWithImageWidget(
            urlImage: project.imgUrl[0],
            bannerBackground: bannerBackground,
            listUrlIcon: project.imgIconLanguage,
            size: size,
            title: project.name,
            description: project.description);
  }
}

class ProjectWidget extends StatelessWidget {
  final bool bannerBackground;
  final List<String> listUrlIcon;
  final Size size;
  final String title;
  final String description;
  const ProjectWidget(
      {super.key,
      required this.bannerBackground,
      required this.listUrlIcon,
      required this.size,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: size.height * 0.1),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: AutoSizeText(
                      maxLines: 1,
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: AutoSizeText(
                      description,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  )),
                  Container(
                    height: 70,
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
                          listUrlIcon.length,
                          (index) {
                            return SvgPicture.asset(
                              listUrlIcon[index],
                              width: 50,
                            );
                          },
                        )),
                  )
                ])));
  }
}

class ProjectWithImageWidget extends StatelessWidget {
  final String urlImage;
  final bool bannerBackground;
  final List<String> listUrlIcon;
  final Size size;
  final String title;
  final String description;
  const ProjectWithImageWidget(
      {super.key,
      required this.urlImage,
      required this.bannerBackground,
      required this.listUrlIcon,
      required this.size,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 480,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: size.height * 0.1),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            width: 310,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: AutoSizeText(
                    maxLines: 1,
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
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
                        listUrlIcon.length,
                        (index) {
                          return SvgPicture.asset(
                            listUrlIcon[index],
                            width: 50,
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
          if (!bannerBackground)
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      urlImage,
                      width: 260,
                    )))
        ]));
  }
}
