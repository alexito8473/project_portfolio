import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:proyect_porfolio/ui/utils/CreateListProject.dart';
import '../widgets/header_widegts.dart';
import '../widgets/listProject_widget.dart';
import '../widgets/listTechnology_widgets.dart';
import '../widgets/works_widget.dart';
import '../widgets/NavigationHome_widgets.dart';
import '../widgets/customButton_widget.dart';

class HomeScreens extends StatefulWidget {
  final Function scrollToItem;
  final ScrollController scrollController;
  final PreferredSizeWidget appBarNavigation;
  final List<GlobalKey> listGlobalKey;
  final bool isTopNavigation;
  final bool isMobile;
  final Size size;
  final bool isDarkMode;
  const HomeScreens(
      {super.key,
      required this.scrollToItem,
      required this.scrollController,
      required this.appBarNavigation,
      required this.listGlobalKey,
      required this.isTopNavigation,
      required this.isMobile,
      required this.size,
      required this.isDarkMode});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: NavigationBottom(
          haveNavigation: widget.isTopNavigation,
          size: widget.size,
          isMobile: widget.isMobile,
          scrollToItem: widget.scrollToItem,
          listGlobalKey: widget.listGlobalKey,
          isDarkMode: widget.isDarkMode,
        ),
        appBar: widget.appBarNavigation,
        body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
              baseColor: Colors.blue,
              opacityChangeRate: 0.25,
              minOpacity: widget.isDarkMode ? 0.1 : 0.05,
              maxOpacity: widget.isDarkMode ? 0.4 : 0.1,
              spawnMinSpeed: 20.0,
              spawnMaxSpeed: 30.0,
              spawnMinRadius: 7.0,
              spawnMaxRadius: 20.0,
              particleCount: 10,
            )),
            vsync: this,
            child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Column(
                  children: [
                    HeaderWidget(
                      key: widget.listGlobalKey[0],
                      size: widget.size,
                      isMobile: widget.isMobile,
                      durationAnimation: const Duration(milliseconds: 300),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: widget.size.height * 0.02,
                            bottom: widget.size.height * 0.01),
                        width: widget.size.width * 0.70,
                        child: widget.isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          AppLocalizations.of(context)!.aboutMe,
                                          style: const TextStyle(fontSize: 40),
                                        )),
                                    const ButtonDownloadPdf()
                                  ])
                            : Wrap(
                                spacing: 10,
                                runSpacing: 20,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.center,
                                children: [
                                    Text(
                                      AppLocalizations.of(context)!.aboutMe,
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                    const ButtonDownloadPdf()
                                  ])),
                    SizedBox(
                        width: widget.size.width * 0.70,
                        child: Text(
                          AppLocalizations.of(context)!.aboutMeDescription,
                          style: const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.justify,
                        )),
                    TitleHome(
                      key: widget.listGlobalKey[1],
                      size: widget.size,
                      spaceFinal: widget.size.width * 0.70,
                      title: AppLocalizations.of(context)!.technologies,
                    ),
                    TechnologyWidget(
                      size: widget.size,
                      isMobile: widget.isMobile,
                      durationAnimation: const Duration(milliseconds: 300),
                      beveledRectangleBorder: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    TitleHome(
                      key: widget.listGlobalKey[2],
                      size: widget.size,
                      spaceFinal: widget.size.width * 0.70,
                      title: AppLocalizations.of(context)!.workExperience,
                    ),
                    EducationWidget(
                      size: widget.size,
                      isMobile: widget.isMobile,
                    ),
                    TitleHome(
                      key: widget.listGlobalKey[3],
                      size: widget.size,
                      spaceFinal: widget.size.width * 0.70,
                      title: AppLocalizations.of(context)!.projects,
                    ),
                    ListProjectWidget(
                      durationAnimation: const Duration(milliseconds: 300),
                      isMobile: widget.isMobile,
                      size: widget.size,
                      spaceFinal: widget.size.width * 0.70,
                      listProject: createListProject(),
                      changeBanner: widget.isTopNavigation,
                    ),
                    TitleHome(
                      key: widget.listGlobalKey[4],
                      size: widget.size,
                      spaceFinal: widget.size.width * 0.70,
                      title: "aaaaaaa",
                    ),
                    EducationWidget(
                      size: widget.size,
                      isMobile: widget.isMobile,
                    ),
                    SizedBox(
                      height: widget.size.height * 0.2,
                    ),
                  ],
                ))));
  }
}
