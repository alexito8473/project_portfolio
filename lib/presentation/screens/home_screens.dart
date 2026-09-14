import 'package:animated_background/animated_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/calculate_size.dart';
import '../widgets/header/header_widegt.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController;
  final List<Widget> listWidgetHome;
  final ParticleOptions particleOptions;
  final Function scrollNavigation;
  final TickerProvider vsync;
  final ValueListenable<bool> changeTop;
  final ValueListenable<bool> moveTop;
  final ValueListenable<bool> isActiveMove;
  final ValueListenable<Offset> mousePosition;
  final Function onHover;
  final Function? reset;
  final Function onDoubleTap;

  const HomeScreen({super.key,
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
    required this.onDoubleTap,
    required this.particleOptions});

  @override
  Widget build(BuildContext context) {
    print("Repintado");
    final isMobile = CalculateSize.isMobile(MediaQuery.sizeOf(context));
    final content = MouseRegion(
        onHover: (event) => onHover(event),
        child: Stack(children: [
          Positioned.fill(
              child: CustomScrollView(
                  controller: scrollController,
                  physics: const RangeMaintainingScrollPhysics(),
                  slivers: listWidgetHome)),
          ValueListenableBuilder<Offset>(
              valueListenable: mousePosition,
              builder: (context, position, child) {
                return ValueListenableBuilder<bool>(
                    valueListenable: moveTop,
                    builder: (context, isMoved, child) {
                      return ValueListenableBuilder<bool>(
                          valueListenable: isActiveMove,
                          builder: (context, isActive, child) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: changeTop,
                                builder: (context, isChangeTop, child) {
                                  return Positioned(
                                      top: position.dy,
                                      left: position.dx,
                                      right: isMoved || isActive ? null : 0,
                                      child: CustomAppBar(
                                          changeScroll: (value) => scrollNavigation(value),
                                          changeTop: isChangeTop,
                                          reset: isActive ? reset : null,
                                          onDoubleTap: onDoubleTap,
                                          canNotTapButton: isMoved));
                                });
                          });
                    });
              })
        ]));

    return Material(child: isMobile
        ? content
        : AnimatedBackground(behaviour: RandomParticleBehaviour(paint: Paint(), options: particleOptions), vsync: vsync, child: content));
  }
}
