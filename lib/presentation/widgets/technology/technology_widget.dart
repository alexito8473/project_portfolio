import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
import '../../../data/dataSource/tecnology_data.dart';
import '../customWidget/custom_button_widget.dart';

class TechnologyWidget extends StatefulWidget {
  final Knowledge knowledge;
  final Function onTap;
  final Function colorActive;
  final Function colorNoActive;
  const TechnologyWidget(
      {super.key,
      required this.knowledge,
      required this.onTap,
      required this.colorActive,
      required this.colorNoActive});
  @override
  State<TechnologyWidget> createState() => _TechnologyWidget();
}

class _TechnologyWidget extends State<TechnologyWidget> {
  late Future<String> _svgFuture;
  bool isActivate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _svgFuture = _preloadSvg(widget.knowledge.technology.urlIcon);
  }

  Future<String> _preloadSvg(String assetPath) async {
    return await DefaultAssetBundle.of(context).loadString(assetPath);
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
            onTap: () => widget.onTap(widget.knowledge),
            child: AnimatedContainer(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActivate
                        ? widget.colorActive()
                        : widget.colorNoActive()),
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
                      return SvgPicture.string(snapshot.data!,
                          color: widget.knowledge.technology.changeColor
                              ? context
                                  .watch<AppThemeBloc>()
                                  .state
                                  .isDarkModeColor()
                              : null,
                          width: 60);
                    }))));
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

class SliverSingleChoice extends StatelessWidget {
  const SliverSingleChoice({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.center, child: SingleChoice());
  }
}
