import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Project.dart';
import 'customButton_widget.dart';

class BannerProject extends StatelessWidget {
  final Size size;
  final ProjectRelease projectRelease;
  const BannerProject(
      {super.key, required this.size, required this.projectRelease});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 400,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(projectRelease.project.imgUrl[0],
                    fit: BoxFit.none,

                    color: Colors.black.withOpacity(0.8),
                    colorBlendMode: BlendMode.darken,
                    width: 300,
                    height: 400,
                    scale: 3,
                    filterQuality: FilterQuality.none)),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: AutoSizeText(
                        maxLines: 1,
                        projectRelease.project.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        projectRelease.getDescription(context),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 45,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Colors.white24,
                                        blurRadius: 4,
                                        spreadRadius: 4),
                                    BoxShadow(
                                        color:
                                            Colors.blueAccent.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 2)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                        projectRelease.project.imgIconLanguage
                                            .length, (index) {
                                      return SvgPicture.asset(
                                          projectRelease
                                              .project.imgIconLanguage[index],
                                          width: 35);
                                    })))),
                        ButtonGithubProject(
                            size: size,
                            uri: Uri.parse(
                                projectRelease.project.repositoryUrl)),
                      ],
                    )
                  ],
                )),
          ],
        ));
  }
}
