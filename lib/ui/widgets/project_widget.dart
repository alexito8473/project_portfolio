import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/Project.dart';

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
    return Container(
      width: 1200,
      height: 500,
      decoration: BoxDecoration(
          color:
              !changeBanner ? Colors.grey.withOpacity(0.4) : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: size.height * 0.1),
      child: !changeBanner
          ? Row(
              textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
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
                          flex: 5,
                          child: Text(
                            project.description,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: bannerBackground
                                  ? null
                                  : isLtr
                                      ? EdgeInsets.only(left: size.width * 0.03)
                                      : EdgeInsets.only(
                                          right: size.width * 0.03),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    project.imgIconLanguage.length,
                                    (index) {
                                      return Image.asset(
                                        project.imgIconLanguage[index],
                                        width: 40,
                                        height: 40,
                                      );
                                    },
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
                if (!bannerBackground)
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.03),
                    width: size.width * 0.25,
                    child: Image.asset(project.imgUrl[0]),
                  )
              ],
            )
          : Row(
              textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
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
                        flex: 5,
                        child: Text(
                          project.description,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  project.imgIconLanguage.length,
                                  (index) {
                                    return Image.asset(
                                      project.imgIconLanguage[index],
                                      width: 40,
                                      height: 40,
                                    );
                                  },
                                ))),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(3, (index) {
                              return Image.asset(
                                project.imgUrl[index],
                                fit: BoxFit.contain,
                                width: size.width * 0.13,
                              );
                            }))))
              ],
            ),
    );
  }
}
