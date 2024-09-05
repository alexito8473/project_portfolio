import 'package:flutter/material.dart';
import 'package:proyect_porfolio/ui/widgets/project_widget.dart';

import '../../models/Project.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListProject extends StatelessWidget {
  final Size size;
  final bool isTopNavigation;
  final bool isMobile;
  final bool bannerBackground;
  const ListProject(
      {super.key,
      required this.size,
      required this.isTopNavigation,
      required this.isMobile,
      required this.bannerBackground});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepaintBoundary(
            child: TitleHome(
                size: size,
                title: AppLocalizations.of(context)!.projects,
                isMobile: isMobile)),
        RepaintBoundary(
            child: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.05,
              right: size.width * 0.05),
          child: Wrap(
            spacing: 40,
            runSpacing: size.height * .07,
            alignment: WrapAlignment.center,
            children: List.generate(
              ProjectRelease.values.length,
              (index) {
                return BannerProject(
                    size: size, projectRelease: ProjectRelease.values[index]);
              },
            ),
          ),
        )),
      ],
    );
  }
}
