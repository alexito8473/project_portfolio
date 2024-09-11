import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/ui/widgets/titleCustom.dart';

import '../../models/Project.dart';
import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import '../utils/CheckSize.dart';
import 'customButton_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = CheckSize.isMobile(size);
    return Column(
      children: [
        TitleHome(
            size: size,
            title: AppLocalizations.of(context)!.projects,
            isMobile: isMobile),
        Container(
          padding: EdgeInsets.only(top: size.height * 0.05),
          width: size.width * .7,
          child: Wrap(
            spacing: 40,
            runSpacing: isMobile ? 35 : size.height * .07,
            alignment: WrapAlignment.center,
            children: List.generate(
              ProjectRelease.values.length,
              (index) {
                return BannerProject(
                  size: size,
                  projectRelease: ProjectRelease.values[index],
                  isMobile: isMobile,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class BannerProject extends StatelessWidget {
  final Size size;
  final ProjectRelease projectRelease;
  final bool isMobile;
  const BannerProject(
      {super.key,
      required this.size,
      required this.projectRelease,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration( boxShadow: [
          context.watch<AppThemeBloc>().state.isDarkMode()
              ? const BoxShadow(
                  color: Colors.white54,
                  blurRadius: 20,
                  spreadRadius: 1.2,
                )
              : BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 1.2,
                )
        ]),
        width: isMobile ? null : 400,
        height: 350,
        child: Stack(
          children: [
            Container(
              width: isMobile ? null : 400,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                      image: AssetImage(projectRelease.project.imgUrl[0]),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.62), BlendMode.darken),
                      alignment: Alignment.topCenter,
                      filterQuality: FilterQuality.none)),
            ),
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
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                                ],
                              ),
                              child: Wrap(
                                  alignment:WrapAlignment.spaceAround,
                                  children: List.generate(
                                      projectRelease.project.imgIconLanguage
                                          .length, (index) {
                                    return SvgPicture.asset(
                                        projectRelease
                                            .project.imgIconLanguage[index],
                                        width: isMobile?30:45);
                                  }))),
                        ),
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
