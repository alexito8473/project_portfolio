import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/listTechnology/list_technology_bloc.dart';
import '../../models/Technology.dart';
import '../../structure/blocs/appTheme/app_theme_bloc.dart';
import 'columnListTechnology_Widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TechnologyWidget extends StatelessWidget {
  final Size size;
  final BeveledRectangleBorder beveledRectangleBorder;
  final Duration durationAnimation;
  final bool isMobile;
  const TechnologyWidget(
      {super.key,
      required this.size,
      required this.durationAnimation,
      required this.isMobile,
      required this.beveledRectangleBorder});

  void createFrame(BuildContext context, Technology technology) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            Color background =
                state.appTheme == AppTheme.DARK ? Colors.black : Colors.white;
            return AlertDialog(
              shadowColor: state.appTheme == AppTheme.DARK
                  ? Colors.white10
                  : Colors.black12,
              content: Container(
                width: 350,
                height: !isMobile ? 380 : 430,
                decoration: BoxDecoration(
                    color: background, borderRadius: BorderRadius.circular(10)),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: RadialGradient(
                            center: Alignment.topLeft,
                            radius: !isMobile ? 1.4 : 1.8,
                            stops: const [
                              0.8,
                              0.8,
                              1,
                              1
                            ],
                            colors: [
                              background,
                              technology.color.withOpacity(0.5),
                              technology.color.withOpacity(0.5),
                              background,
                            ])),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 5,
                            left: 5,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(technology.urlIcon))),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      maxLines: 2,
                                      '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: AutoSizeText(
                                  maxLines: 11,
                                  technology.typeDescription
                                      .getDescription(context),
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ]))
                      ],
                    )),
              ),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              elevation: 24.0, // Controla la sombra para el efecto de elevación
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.15,
            left: size.width * 0.15),
        child: BlocBuilder<ListTechnologyBloc, ListTechnologyState>(
          builder: (context, state) {
            if (!isMobile) {
              return Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                runSpacing: 30,
                children: [
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyMobile,
                    isMobile: isMobile,
                    size: size,
                    title: AppLocalizations.of(context)!.mobile,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyBackend,
                    isMobile: isMobile,
                    size: size,
                    title: 'Backend',
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyFrontend,
                    isMobile: isMobile,
                    size: size,
                    title: 'Frontend',
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyLearning,
                    isMobile: isMobile,
                    size: size,
                    title: AppLocalizations.of(context)!.learning,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyTools,
                    isMobile: isMobile,
                    size: size,
                    title: AppLocalizations.of(context)!.tools,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyServers,
                    isMobile: isMobile,
                    size: size,
                    title: AppLocalizations.of(context)!.server,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createFrame: createFrame,
                  ),
                ],
              );
            }
            return Column(
              children: [
                ColumnListTechnologyWidget(
                  listTechnology: state.listTechnologyMobile,
                  isMobile: isMobile,
                  size: size,
                  title: AppLocalizations.of(context)!.mobile,
                  beveledRectangleBorder: beveledRectangleBorder,
                  createFrame: createFrame,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ColumnListTechnologyWidget(
                      listTechnology: state.listTechnologyBackend,
                      isMobile: isMobile,
                      size: size,
                      title: 'Backend',
                      beveledRectangleBorder: beveledRectangleBorder,
                      createFrame: createFrame,
                    )),
                ColumnListTechnologyWidget(
                  listTechnology: state.listTechnologyFrontend,
                  isMobile: isMobile,
                  size: size,
                  title: 'Frontend',
                  beveledRectangleBorder: beveledRectangleBorder,
                  createFrame: createFrame,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ColumnListTechnologyWidget(
                      listTechnology: state.listTechnologyLearning,
                      isMobile: isMobile,
                      size: size,
                      title: AppLocalizations.of(context)!.learning,
                      beveledRectangleBorder: beveledRectangleBorder,
                      createFrame: createFrame,
                    )),
                ColumnListTechnologyWidget(
                  listTechnology: state.listTechnologyTools,
                  isMobile: isMobile,
                  size: size,
                  title: AppLocalizations.of(context)!.tools,
                  beveledRectangleBorder: beveledRectangleBorder,
                  createFrame: createFrame,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ColumnListTechnologyWidget(
                      listTechnology: state.listTechnologyServers,
                      isMobile: isMobile,
                      size: size,
                      title: AppLocalizations.of(context)!.server,
                      beveledRectangleBorder: beveledRectangleBorder,
                      createFrame: createFrame,
                    )),
              ],
            );
          },
        ));
  }
}
