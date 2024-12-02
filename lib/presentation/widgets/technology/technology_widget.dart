import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/data/models/technology.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../data/dataSource/tecnology_data.dart';
import '../customWidget/custom_button_widget.dart';

class TechnologyWidget extends StatefulWidget {
  final Knowledge knowledge;

  const TechnologyWidget({super.key, required this.knowledge});

  @override
  State<TechnologyWidget> createState() => _TechnologyWidget();
}

class _TechnologyWidget extends State<TechnologyWidget> {
  bool isActivate = false;

  Color colorActive() {
    return context.watch<AppThemeBloc>().state.isDarkMode()
        ? Colors.white38
        : Colors.black54;
  }

  Color colorNoActive() {
    return context.watch<AppThemeBloc>().state.isDarkMode()
        ? Colors.white10
        : Colors.black12;
  }
  void createDialogTechnology(BuildContext context, Technology technology,
      bool isMobile, bool isDarkMode) {
    Color background = isDarkMode ? Colors.black : Colors.white;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shadowColor: isDarkMode ? Colors.white10 : Colors.black12,
            content: Container(
                width: 350,
                height: !isMobile ? 380 : 430,
                decoration: BoxDecoration(
                    color: background, borderRadius: BorderRadius.circular(10)),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: const GradientRotation(0.3),
                            stops: const [
                              0.85,
                              0.85,
                              1,
                              1
                            ],
                            colors: [
                              background,
                              technology.color.withOpacity(0.5),
                              technology.color.withOpacity(0.5),
                              background
                            ])),
                    child: Column(children: [
                      SizedBox(
                          height: 40,
                          child: Row(children: [
                            Expanded(
                              child: AutoSizeText(
                                maxLines: 2,
                                '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close))
                          ])),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: AutoSizeText(
                                widget.knowledge.getDescription(context),
                                style: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.justify,
                              ))),
                      Container(
                          height: 60,
                          alignment: Alignment.bottomLeft,
                          child: SvgPicture.asset(technology.urlIcon,
                              color: technology.changeColor
                                  ? context
                                  .watch<AppThemeBloc>()
                                  .state
                                  .isDarkMode()
                                  ? Colors.white
                                  : Colors.black
                                  : null,
                              width: 60))
                    ]))),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            elevation: 24.0);
      },
    );
  }
  void onTap(){
    createDialogTechnology(
        context,
        widget.knowledge.technology,
        ResponsiveBreakpoints.of(context).isMobile,
        context.read<AppThemeBloc>().state.isDarkMode());
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (isActivate) return;
        setState(() {
          isActivate = true;
        });
      },
      onExit: (event) {
        if (!isActivate) return;
        setState(() {
          isActivate = false;
        });
      },
      child: GestureDetector(
          onTap: () => onTap(),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActivate ? colorActive() : colorNoActive(),
          ),
          width: 90,
          height: 90,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 600),
          child: SvgPicture.asset(widget.knowledge.technology.urlIcon,
              color: widget.knowledge.technology.changeColor
                  ? context.watch<AppThemeBloc>().state.isDarkMode()
                  ? Colors.white
                  : Colors.black
                  : null,
              width: 60)
        )
      )
    );
  }
}


class SingleChoice extends StatelessWidget {
  const SingleChoice({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 20,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(
            TypeLanguage.values.length,
            (index) => ButtonSelect(
                title: TypeLanguage.values[index].getTitle(context),
                onPressed: () => context
                    .read<ListTechnologyCubit>()
                    .changeListFiltered(TypeLanguage.values[index]),
                isSelect: TypeLanguage.values[index] ==
                    context
                        .watch<ListTechnologyCubit>()
                        .state
                        .currentTypeLanguage)));
  }
}
