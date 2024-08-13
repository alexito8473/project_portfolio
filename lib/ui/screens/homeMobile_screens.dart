import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/Item.dart';
import '../../models/Project.dart';
import '../widgets/header_widegts.dart';
import '../widgets/listProject.dart';
import '../widgets/listTechnology.dart';
import '../widgets/works_widget.dart';

class HomeMobileScreens extends StatefulWidget {
  final Function createDialogTechnology;
  final PreferredSizeWidget appBarNavigation;
  final List<Project> listProject;
  final bool isTopNavigation;
  final Size size;
  final bool isDarkMode;
  final bool bannerBackground;
  const HomeMobileScreens(
      {super.key,
      required this.appBarNavigation,
      required this.isTopNavigation,
      required this.size,
      required this.isDarkMode,
      required this.createDialogTechnology,
      required this.listProject,
      required this.bannerBackground});

  @override
  State<HomeMobileScreens> createState() => _HomeMobileScreensState();
}

class _HomeMobileScreensState extends State<HomeMobileScreens>
    with TickerProviderStateMixin {
  late Color colorIcon;
  @override
  void initState() {
    colorIcon = widget.isDarkMode ? Colors.white : Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            bottomNavigationBar: RepaintBoundary(
                child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.blue.shade900,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: TabBar(
                      dividerColor: widget.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.blue.shade900,
                      tabs: List.generate(
                        MenuItems.values.length,
                        (index) {
                          return Tooltip(
                            message: MenuItems.values[index].getTitle(context),
                            child: Tab(
                              icon: MenuItems.values[index].getIcon(),
                            ),
                          );
                        },
                      ),
                    ))),
            appBar: widget.appBarNavigation,
            body: AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                  baseColor: Colors.blue,
                  opacityChangeRate: 0.3,
                  minOpacity: widget.isDarkMode ? 0.15 : 0.08,
                  maxOpacity: widget.isDarkMode ? 0.40 : 0.15,
                  spawnMinSpeed: 15.0,
                  spawnMaxSpeed: 25.0,
                  spawnMinRadius: 6.0,
                  spawnMaxRadius: 25.0,
                  particleCount: 7,
                )),
                vsync: this,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: HeaderWidget(
                        size: widget.size,
                        isDarkMode: widget.isDarkMode,
                        isMobile: true,
                      ),
                    ),
                    ListProject(
                        size: widget.size,
                        listProject: widget.listProject,
                        isTopNavigation: widget.isTopNavigation,
                        isMobile: true,
                        bannerBackground: widget.bannerBackground, isDarkMode:widget.isDarkMode,
                      ),
                    SingleChildScrollView(
                      child: LitTechnology(
                        size: widget.size,
                        isMobile: true,
                        isDarkMode: widget.isDarkMode,
                        createDialogTechnology: widget.createDialogTechnology,
                      ),
                    ),
                    SingleChildScrollView(
                      child: EducationWidget(
                        size: widget.size,
                        isMobile: true,
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                    ),
                  ],
                ))));
  }
}
