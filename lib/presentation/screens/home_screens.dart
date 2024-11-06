import 'package:animate_do/animate_do.dart';
import 'package:animated_background/animated_background.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../data/dataSource/menu_items.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
import '../../domain/blocs/appLocale/app_locale_bloc.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/header/header_widegt.dart';

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
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
    widget.scrollController.addListener(() => _scrollListener());
  }

  void _scrollListener() {
    if (_changeTop == context.read<AppBannerTopBloc>().state.isActiveBannerTop)
      return;
    setState(() {
      _changeTop = context.read<AppBannerTopBloc>().state.isActiveBannerTop;
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
    widget.scrollController.removeListener(() => _scrollListener);
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              children: [
                Positioned.fill(
                    child: CustomScrollView(
                        controller: widget.scrollController,
                        slivers: List.generate(widget.listWidgetHome.length,
                            (index) => widget.listWidgetHome[index]))),
                Positioned(
                    top: 0,
                    left: 0,
                    child: CustomAppBar(
                      changeScroll: (value) => widget.scrollNavigation(value),
                      changeTop: _changeTop
                    ))
              ],
            )));
  }
}
