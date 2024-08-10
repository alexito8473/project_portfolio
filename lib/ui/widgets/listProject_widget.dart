import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/material.dart';

import '../../models/Project.dart';
import 'project_widget.dart';

class ListProjectWidget extends StatelessWidget {
  final Duration durationAnimation;
  final bool isMobile;
  final Size size;
  final List<Project> listProject;
  final double spaceFinal;
  final bool changeBanner;
  const ListProjectWidget(
      {super.key,
      required this.durationAnimation,
      required this.isMobile,
      required this.size,
      required this.spaceFinal,
      required this.listProject,
      required this.changeBanner});

  @override
  Widget build(BuildContext context) {
    bool bannerBackground = size.width < 580;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.05),
      width: spaceFinal,
      child: Column(
        children: List.generate(
          listProject.length,
          (index) {
            return ProjectWidget(
              size: size,
              project: listProject[index],
              changeBanner: changeBanner,
              isMobile: isMobile,
              bannerBackground: bannerBackground, isLtr: index%2==0,
            ).increaseSizeOnHover(1.05);
          },
        ),
      ),
    );
  }
}
