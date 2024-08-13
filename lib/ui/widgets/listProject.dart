import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:proyect_porfolio/ui/widgets/project_widget.dart';

import '../../models/Project.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListProject extends StatelessWidget {
  final Size size;
  final List<Project> listProject;
  final bool isTopNavigation;
  final bool isMobile;
  final bool isDarkMode;
  final bool bannerBackground;
  const ListProject(
      {super.key,
      required this.size,
      required this.listProject,
      required this.isTopNavigation,
      required this.isMobile,
      required this.bannerBackground, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepaintBoundary(
            child: TitleHome(
          size: size,
          spaceFinal: size.width * 0.70,
          title: AppLocalizations.of(context)!.projects,
        )),
        isMobile
            ? Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*.1),
                    child: CarouselSlider.builder(
                          unlimitedMode: true,
                          slideBuilder: (index) {
                            return GestureDetector(
                              onTap: (){},
                              child: ContainerProjectWidget(
                                size: size,
                                project: listProject[index],
                                changeBanner: isTopNavigation,
                                isMobile: isMobile,
                                bannerBackground: bannerBackground,
                                isLtr: index % 2 == 0,
                              )
                            )  ;
                          },
                          slideTransform: const DepthTransform(),
                          // DepthTransform(),
                          // ZoomOutSlideTransform()
                          slideIndicator: CircularSlideIndicator(
                            indicatorBackgroundColor: isDarkMode?Colors.white:Colors.grey,
                            currentIndicatorColor: Colors.red,
                            padding: const EdgeInsets.only(bottom: 32),
                          ),
                          itemCount: listProject.length),
                    ))
            : Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                width: bannerBackground ? size.width * 0.7 : size.width * 0.8,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    listProject.length,
                    (index) {
                      return RepaintBoundary(
                          child: ContainerProjectWidget(
                        size: size,
                        project: listProject[index],
                        changeBanner: isTopNavigation,
                        isMobile: isMobile,
                        bannerBackground: bannerBackground,
                        isLtr: index % 2 == 0,
                      ).increaseSizeOnHover(1.05));
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
