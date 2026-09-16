import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
import 'package:proyect_porfolio/l10n/app_localizations.dart';
import '../../../data/dataSource/tecnology_data.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../customWidget/custom_button_widget.dart';

class TechnologyWidget extends StatefulWidget {
  final Knowledge knowledge;
  final Function onTap;
  const TechnologyWidget({super.key, required this.knowledge, required this.onTap});
  @override
  State<TechnologyWidget> createState() => _TechnologyWidget();
}

class _TechnologyWidget extends State<TechnologyWidget> {
  late Future<String> _svgFuture;
  final ValueNotifier<bool> isActivate = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    _svgFuture = _preloadSvg(widget.knowledge.technology.urlIcon);
  }

  Future<String> _preloadSvg(String assetPath) async {
    return await DefaultAssetBundle.of(context).loadString(assetPath);
  }
  Color colorActive(bool isDarkMode) {
    return isDarkMode ? Colors.white38 : Colors.black54;
  }
  Color colorNoActive(bool isDarkMode) {
    return isDarkMode ? Colors.white10 : Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          if (isActivate.value) return;
          isActivate.value = true;
        },
        onExit: (event) {
          if (!isActivate.value) return;
          isActivate.value = false;
        },
        child: GestureDetector(
            onTap: () => widget.onTap(context, widget.knowledge),
            child: ValueListenableBuilder<bool>(
              valueListenable: isActivate,
              builder: (context, value, child) {
                return BlocBuilder<AppThemeCubit,AppThemeState>(builder: (context, state) {
                  return AnimatedContainer(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: value ? colorActive(state.appTheme.isDarkMode()) : colorNoActive(state.appTheme.isDarkMode())),
                      width: 90,
                      height: 90,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 600),
                      child: FutureBuilder<String>(
                          future: _svgFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return const CircularProgressIndicator(
                                color: Colors.red,
                              );
                            }
                            if (widget.knowledge.technology.changeColor) {
                              return BlocSelector<AppThemeCubit, AppThemeState, Color>(
                                  selector: (state) => state.isDarkModeColor(),
                                  builder: (context, state) => SvgPicture.string(snapshot.data!, color: state, width: 60));
                            }
                            return SvgPicture.string(snapshot.data!, width: 60);
                          }));
                },);

              },
            )));
  }
}

class SingleChoice extends StatelessWidget {
  const SingleChoice({super.key});
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Wrap(
        spacing: 20,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(
            TypeLanguage.values.length,
            (index) => BlocSelector<ListTechnologyCubit, ListTechnologyState, TypeLanguage>(
                selector: (state) => state.currentTypeLanguage,
                builder: (context, state) => ButtonSelect(
                    title: TypeLanguage.values[index].getTitle(locale),
                    onPressed: () => context.read<ListTechnologyCubit>().changeListFiltered(TypeLanguage.values[index]),
                    isSelect: TypeLanguage.values[index] == state))));
  }
}

class SliverSingleChoice extends StatelessWidget {
  const SliverSingleChoice({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.center, child: SingleChoice());
  }
}
