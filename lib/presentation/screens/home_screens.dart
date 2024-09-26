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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() =>
        context.read<AppBannerTopBloc>().add(widget.updateNavigationEvent));
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Padding(
                  padding: EdgeInsets.only(
                      left:
                          ResponsiveBreakpoints.of(context).screenWidth * 0.05),
                  child: const AutoSizeText("Full Stack Developer",
                      style: TextStyle(fontSize: 28), maxLines: 1)),
          actions: [
            IconButton(
                onPressed: () =>
                    context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
                icon: Text(
                    BlocProvider.of<AppLocaleBloc>(context)
                        .state
                        .locale
                        .getLenguajeCode(),
                    style: const TextStyle(fontSize: 25))),
            Padding(
                padding: EdgeInsets.only(
                    right: ResponsiveBreakpoints.of(context).screenWidth * 0.01,
                    left: ResponsiveBreakpoints.of(context).screenWidth * 0.01),
                child: IconButton(
                    onPressed: () =>
                        context.read<AppThemeBloc>().add(ChangeThemeEvent()),
                    icon: BlocProvider.of<AppThemeBloc>(context)
                        .state
                        .appTheme
                        .getIcon())),
            Padding(
                padding: EdgeInsets.only(
                    right:
                        ResponsiveBreakpoints.of(context).screenWidth * 0.05),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                        customButton: const Icon(Icons.list, size: 38),
                        items: List.generate(
                          MenuItems.values.length,
                          (index) {
                            return DropdownMenuItem<int>(
                                value: index,
                                child:
                                    MenuItems.values[index].buildItem(context));
                          },
                        ),
                        onChanged: (value) => widget.scrollNavigation(value),
                        barrierColor: Colors.black.withOpacity(0.4),
                        dropdownStyleData: DropdownStyleData(
                            width: 170,
                            useSafeArea: true,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: context
                                        .watch<AppThemeBloc>()
                                        .state
                                        .isDarkMode()
                                    ? Colors.grey.shade800
                                    : Colors.blueAccent)))))
          ],
          flexibleSpace: Center(
              child: context.watch<AppBannerTopBloc>().state.isActiveBannerTop &&
                      !ResponsiveBreakpoints.of(context).isMobile
                  ? FadeIn(child: const HeaderTop())
                  : const SizedBox()),
          shadowColor: context.watch<AppThemeBloc>().state.isDarkMode()
              ? Colors.grey
              : Colors.black,
          toolbarHeight: ResponsiveBreakpoints.of(context).isMobile ? 65 : 80),
      body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              paint: Paint(),
              options: ParticleOptions(
                  baseColor: Colors.blue,
                  opacityChangeRate: 0.30,
                  minOpacity: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? 0.11
                      : 0.08,
                  maxOpacity:
                      context.watch<AppThemeBloc>().state.isDarkMode() ? 0.45 : 0.13,
                  spawnMinSpeed: 20.0,
                  spawnMaxSpeed: 30.0,
                  spawnMinRadius: 7.0,
                  spawnMaxRadius: 30.0,
                  particleCount: ResponsiveBreakpoints.of(context).isMobile ? 6 : 10)),
          vsync: this,
          child: SingleChildScrollView(controller: widget.scrollController, child: Column(children: List.generate(widget.listWidgetHome.length, (index) => RepaintBoundary(child: FadeIn(child: widget.listWidgetHome[index])))))));
}
