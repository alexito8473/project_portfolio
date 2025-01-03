import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:proyect_porfolio/presentation/widgets/technology/technology_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../data/dataSource/tecnology_data.dart';
import '../../../domain/cubits/listTechnology/list_technology_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListTechnology extends StatelessWidget {
  const ListTechnology({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData data = ResponsiveBreakpoints.of(context);
    return SliverToBoxAdapter(
        child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: data.screenHeight * 0.65),
            margin: EdgeInsets.only(bottom: data.screenHeight * 0.2),
            padding: EdgeInsets.symmetric(
                horizontal: data.isMobile
                    ? data.screenWidth * 0.05
                    : data.screenWidth * 0.1),
            child: Column(children: [
              const SliverSingleChoice(),
              SizedBox(height: data.screenHeight * 0.05),
              Container(
                  constraints: const BoxConstraints(minHeight: 400),
                  child: const AnimatedListTechnology())
            ])));
  }
}

class AnimatedListTechnology extends StatelessWidget {
  const AnimatedListTechnology({super.key});

  void createDialogTechnology(
      BuildContext context, Knowledge know, bool isMobile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
          Color background = state.appTheme.isDarkMode() ? Colors.black : Colors.white;
          return AlertDialog(
              shadowColor: state.appTheme.isDarkMode() ? Colors.white10 : Colors.black12,
              content: Container(
                  width: 350,
                  height: !isMobile ? 380 : 430,
                  decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(10)),
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
                                know.technology.color.withOpacity(0.5),
                                know.technology.color.withOpacity(0.5),
                                background
                              ])),
                      child: Column(children: [
                        SizedBox(
                            height: 40,
                            child: Row(children: [
                              Expanded(
                                child: AutoSizeText(
                                  maxLines: 2,
                                  '${AppLocalizations.of(context)!.myExperience} ${know.technology.name}',
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
                                  know.getDescription(context),
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ))),
                        Container(
                            height: 60,
                            alignment: Alignment.bottomLeft,
                            child: SvgPicture.asset(know.technology.urlIcon,
                                color: know.technology.changeColor
                                    ? state.appTheme.isDarkMode()
                                        ? Colors.white
                                        : Colors.black
                                    : null,
                                width: 60))
                      ]))),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: 24.0);
        });
      },
    );
  }

  void _onTap(BuildContext context,Knowledge know) {
    createDialogTechnology(
        context, know, ResponsiveBreakpoints.of(context).isMobile);
  }

  Color colorActive(BuildContext context) {
    return context.watch<AppThemeCubit>().state.appTheme.isDarkMode()
        ? Colors.white38
        : Colors.black54;
  }

  Color colorNoActive(BuildContext context) {
    return context.watch<AppThemeCubit>().state.appTheme.isDarkMode()
        ? Colors.white10
        : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTechnologyCubit, ListTechnologyState>(
        builder: (context, state) {
      return Wrap(
          runSpacing: 20,
          spacing: 20,
          alignment: WrapAlignment.center,
          children: List.generate(state.lengthListLate, (index) {
            return FadeInLeft(
                duration: Duration(milliseconds: 800 + (index * 50)),
                curve: Curves.linear,
                child: TechnologyWidget(
                    knowledge: state.listFiltered[index],
                    onTap: _onTap,
                    colorActive: colorActive,
                    colorNoActive: colorNoActive));
          }));
    });
  }
}
