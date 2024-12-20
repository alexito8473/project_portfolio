import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/header/header_widegt.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController;
  final List<Widget> listWidgetHome;
  final ParticleOptions particleOptions;
  final Function scrollNavigation;
  final TickerProvider vsync;
  final bool changeTop;
  final bool moveTop;
  final bool isActiveMove;
  final Offset mousePosition;
  final Function onHover;
  final Function? reset;
  final Function onDobleTap;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.listWidgetHome,
      required this.scrollNavigation,
      required this.vsync,
      required this.changeTop,
      required this.moveTop,
      required this.isActiveMove,
      required this.mousePosition,
      required this.onHover,
      required this.reset,
      required this.onDobleTap,
      required this.particleOptions});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                paint: Paint(), options: particleOptions),
            vsync: vsync,
            child: MouseRegion(
                onHover: (event) => onHover(event),
                child: Stack(children: [
                  Positioned.fill(
                      child: CustomScrollView(
                          controller: scrollController,
                          physics: const RangeMaintainingScrollPhysics(),
                          slivers: List.generate(listWidgetHome.length,
                              (index) => listWidgetHome[index]))),
                  Positioned(
                      top: mousePosition.dy,
                      left: mousePosition.dx,
                      right: moveTop || isActiveMove ? null : 0,
                      child: CustomAppBar(
                          changeScroll: (value) => scrollNavigation(value),
                          changeTop: changeTop,
                          reset: reset,
                          onDoubleTap: onDobleTap,
                          canNotTapButton: moveTop))
                ]))));
  }
}

