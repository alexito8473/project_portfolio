import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  final bool isMobile;
  final Function createFrame;
  const TechnologyView({
    super.key,
    required this.size,
    required this.technology,
    required this.isMobile,
    required this.createFrame,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => createFrame(context, technology, isMobile,
            context.read<AppThemeBloc>().state.isDarkMode()),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(technology.urlIcon,
              color: technology.changeColor
                  ? context.watch<AppThemeBloc>().state.isDarkMode()
                      ? Colors.white
                      : Colors.black
                  : null,
              width: 70),
        ));
  }
}
