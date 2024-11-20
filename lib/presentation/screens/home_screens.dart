import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/header/header_widegt.dart';
import 'dart:html' as html;

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final UpdateNavigationEvent updateNavigationEvent;
  final List<Widget> listWidgetHome;
  final Function scrollNavigation;
  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.updateNavigationEvent,
      required this.listWidgetHome,
      required this.scrollNavigation});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _changeTop = false;
  bool moveTop = false;
  bool isActiveMove = false;
  Offset _mousePosition = Offset.zero;
  Offset? _mousePositionSecond;
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
    widget.scrollController.addListener(() => _scrollListener());
    html.window.onResize.listen((event) {
      _onResize();
    },);
  }


  void _scrollListener() {
    if (_changeTop == context.read<AppBannerTopBloc>().state.isActiveBannerTop) return;
    setState(() {
      _changeTop = context.read<AppBannerTopBloc>().state.isActiveBannerTop;
    });
  }

  void _onResize() {
    if (!isActiveMove) return;
    if (ResponsiveBreakpoints.of(context).isMobile && isActiveMove) {
      reset();
    }else{
      setState(() {
        _mousePosition = Offset(
          _mousePosition.dx.clamp(0,ResponsiveBreakpoints.of(context).screenWidth- 300), // Ancho del widget
          _mousePosition.dy.clamp(0,ResponsiveBreakpoints.of(context).screenHeight - 100),
        );
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
    widget.scrollController.removeListener(() => _scrollListener);
    widget.scrollController.dispose();
    super.dispose();
  }

  void reset(){
    setState(() {
      _mousePositionSecond = null;
      _mousePosition = Offset.zero;
      moveTop = false;
      isActiveMove = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                paint: Paint(),
                options: ParticleOptions(
                    baseColor: Colors.blue,
                    image: null,
                    opacityChangeRate: 0.30,
                    minOpacity: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? 0.11
                        : 0.08,
                    maxOpacity: context.watch<AppThemeBloc>().state.isDarkMode()
                        ? 0.45
                        : 0.13,
                    spawnMinSpeed: 20.0,
                    spawnMaxSpeed: 30.0,
                    spawnMinRadius: 7.0,
                    spawnMaxRadius: 30.0,
                    particleCount:
                        ResponsiveBreakpoints.of(context).isMobile ? 6 : 10)),
            vsync: this,
            child: MouseRegion(
                onHover: (event) {
                  if (isMobile) return;
                  _mousePositionSecond =
                      Offset(event.position.dx - 100, event.position.dy - 50);
                  if (!moveTop) return;
                  setState(() {
                    _mousePosition =
                        Offset(event.position.dx - 100, event.position.dy - 50);
                  });
                },
                child: Stack(children: [
                  Positioned.fill(
                      child: CustomScrollView(
                          controller: widget.scrollController,
                          slivers: List.generate(widget.listWidgetHome.length,
                              (index) => widget.listWidgetHome[index]))),
                  Positioned(
                      top: _mousePosition.dy,
                      left: _mousePosition.dx,
                      right: moveTop || isActiveMove ? null : 0,
                      child: CustomAppBar(
                        changeScroll: (value) => widget.scrollNavigation(value),
                        changeTop: _changeTop,
                        reset: isActiveMove
                            ? () => reset()
                            : null,
                        onDoubleTap: () {
                          if (isMobile) return;
                          if (_mousePositionSecond == null) return;
                          if (!isActiveMove) {
                            isActiveMove = true;
                          }
                          setState(() {
                            _mousePosition = _mousePositionSecond!;
                            moveTop = !moveTop;
                          });
                        },
                        canNotTapButton: moveTop,
                      ))
                ]))));
  }
}
