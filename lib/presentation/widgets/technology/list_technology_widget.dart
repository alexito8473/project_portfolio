import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';
import 'package:proyect_porfolio/presentation/widgets/technology/technology_widget.dart';
import '../../../data/dataSource/tecnology_data.dart';
import '../../../domain/cubits/listTechnology/list_technology_cubit.dart';

import '../../../l10n/app_localizations.dart';

class ListTechnology extends StatelessWidget {
  const ListTechnology({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
        child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: size.height * 0.65),
            margin: EdgeInsets.only(bottom: size.height * 0.2),
            padding: EdgeInsets.symmetric(
                horizontal: CalculateSize.isMobile(size)
                    ? size.width * 0.05
                    : size.width * 0.1),
            child: Column(children: [
              const SliverSingleChoice(),
              SizedBox(height:size.height * 0.05),
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
    final AppLocalizations locale = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
          Color background =
              state.appTheme.isDarkMode() ? Colors.black : Colors.white;
          return AlertDialog(
              shadowColor:
                  state.appTheme.isDarkMode() ? Colors.white10 : Colors.black12,
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
                                  '${locale.myExperience} ${know.technology.name}',
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
                                  know.getDescription(locale),
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

  void _onTap(BuildContext context, Knowledge know) {
    createDialogTechnology(
        context, know, CalculateSize.isMobile(MediaQuery.sizeOf(context)));
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
