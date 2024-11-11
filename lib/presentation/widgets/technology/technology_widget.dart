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

class TechnologyWidget extends StatefulWidget {
  final Technology technology;

  const TechnologyWidget({super.key, required this.technology});

  @override
  State<TechnologyWidget> createState() => _TechnologyWidget();
}

class _TechnologyWidget extends State<TechnologyWidget> {
  bool isActivate = false;

  Color colorActive() {
    return context.watch<AppThemeBloc>().state.isDarkMode()
        ? Colors.white70
        : Colors.black54;
  }

  Color colorNoActive() {
    return context.watch<AppThemeBloc>().state.isDarkMode()
        ? Colors.white10
        : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if(isActivate) return;
        setState(() {
          isActivate = true;
        });
      },
      onExit: (event) {
        if(!isActivate) return;
        setState(() {
          isActivate = false;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActivate ? colorActive() : colorNoActive(),
        ),
        width: 100,
        height: 100,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 400),
        child: TechnologyView(technology: widget.technology),
      ),
    );
  }
}

class TechnologyView extends StatelessWidget {
  final Technology technology;

  const TechnologyView({super.key, required this.technology});

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
                  child: Column(
                    children: [
                      SizedBox(
                          height: 40,
                          child: Row(
                            children: [
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
                            ],
                          )),
                      Expanded(child:Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: AutoSizeText(
                          technology.typeDescription.getDescription(context),
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        )) ),
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
                              width: 60)),
                    ],
                  )),
            ),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            elevation: 24.0);

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => createDialogTechnology(
          context,
          technology,
          ResponsiveBreakpoints.of(context).isMobile,
          context.read<AppThemeBloc>().state.isDarkMode()),
      child: SvgPicture.asset(technology.urlIcon,
          color: technology.changeColor
              ? context.watch<AppThemeBloc>().state.isDarkMode()
                  ? Colors.white
                  : Colors.black
              : null,
          width: 70),
    );
  }
}

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TypeLanguage calendarView = TypeLanguage.ALL;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
          TypeLanguage.values.length,
          (index) => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (TypeLanguage.values[index] == calendarView) {
                      return Colors.blueAccent.withOpacity(0.8);
                    }
                    return context.watch<AppThemeBloc>().state.isDarkMode()
                        ? Colors.white70
                        : Colors.grey.shade100;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return Colors.black87;
                  },
                ),
                overlayColor: WidgetStateProperty.resolveWith<Color>(
                  (states) {
                    return Colors.black12;
                  },
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              onPressed: () {
                setState(() => calendarView = TypeLanguage.values[index]);
                BlocProvider.of<ListTechnologyCubit>(context)
                    .changeListFiltered(calendarView);
              },
              child: Container(
                alignment: Alignment.center,
                width: 90,
                height: 40,
                child: AutoSizeText(
                  TypeLanguage.values[index].getTitle(context),
                  maxLines: 1,
                ),
              ))),
    );
  }
}
