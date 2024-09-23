import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/presentation/widgets/technology/technology_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../data/dataSource/menu_items.dart';
import '../../../domain/cubits/listTechnology/list_technology_cubit.dart';
import '../customWidget/title_custom.dart';

class ListTechnology extends StatelessWidget {
  const ListTechnology({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 750),
      padding: EdgeInsets.only(
          left: ResponsiveBreakpoints.of(context).screenWidth * 0.10,
          right: ResponsiveBreakpoints.of(context).screenWidth * 0.10,
          top: ResponsiveBreakpoints.of(context).isMobile
              ? 0
              : ResponsiveBreakpoints.of(context).screenHeight * 0.15,
          bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.2),
      child: Column(children: [
        TitleHome(
            title: MenuItems.KNOWLEDGE.getTitle(context),
            subIcon: MenuItems.KNOWLEDGE.getIcon(size: 40)),
        const Align(alignment: Alignment.center, child: SingleChoice()),
        const SizedBox(height: 40),
        const AnimatedListTechnology()
      ]),
    );
  }
}

class AnimatedListTechnology extends StatefulWidget {
  const AnimatedListTechnology({super.key});

  @override
  State<AnimatedListTechnology> createState() => _AnimatedListTechnologyState();
}

class _AnimatedListTechnologyState extends State<AnimatedListTechnology> {
  late int counterAnimated;

  @override
  void initState() {
    counterAnimated =
        context.read<ListTechnologyCubit>().state.listFiltered.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListTechnologyCubit, ListTechnologyState>(
      listener: (context, state) {
        setState(() {
          counterAnimated = 0;
        });
        Future.delayed(const Duration(milliseconds: 10)).whenComplete(
          () {
            setState(() {
              counterAnimated = state.listFiltered.length;
            });
          },
        );
      },
      builder: (context, state) {
        return Wrap(
          runSpacing: 30,
          spacing: 30,
          alignment: WrapAlignment.center,
          children: List.generate(
            counterAnimated,
            (index) {
              return FadeInLeft(
                duration: Duration(milliseconds: 800 + (index * 50)),
                curve: Curves.linear,
                child: TechnologyWidget(technology: state.listFiltered[index]),
              );
            },
          ),
        );
      },
    );
  }
}
