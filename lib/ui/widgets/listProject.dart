import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyect_porfolio/ui/widgets/project_widget.dart';

import '../../models/Project.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListProject extends StatelessWidget {
  final Size size;
  final List<Project> listProject;
  final bool isTopNavigation;
  final bool isMobile;
  final bool bannerBackground;
  const ListProject(
      {super.key,
      required this.size,
      required this.listProject,
      required this.isTopNavigation,
      required this.isMobile,
      required this.bannerBackground});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHome(
          size: size,
          spaceFinal: size.width * 0.70,
          title: AppLocalizations.of(context)!.projects,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          width: size.width * 0.7,
          child: Column(
            children: List.generate(
              listProject.length,
              (index) {
                return ProjectWidget(
                  size: size,
                  project: listProject[index],
                  changeBanner: isTopNavigation,
                  isMobile: isMobile,
                  bannerBackground: bannerBackground,
                  isLtr: index % 2 == 0,
                ).increaseSizeOnHover(1.05);
              },
            ),
          ),
        ),
      ],
    );
  }
}
