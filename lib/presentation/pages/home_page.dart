import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/appBannerTop/app_banner_top_cubit.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:animated_background/animated_background.dart'
    deferred as background_animated;
import '../../data/dataSource/menu_items.dart' deferred as menu_items;
import '../screens/home_screens.dart' deferred as home;
import '../widgets/certificate/carrousel_Certificate_widget.dart'
    deferred as certificate;
import '../widgets/contacMe/contact_me_widget.dart' deferred as contact_me;
import '../widgets/customWidget/title_custom.dart' deferred as title;
import '../widgets/footer/footer_widget.dart' deferred as footer;
import '../widgets/header/about_me_widget.dart' deferred as about_me;
import '../widgets/header/header_widegt.dart' deferred as header;
import '../widgets/project/project_widget.dart' deferred as projects;
import '../widgets/technology/list_technology_widget.dart'
    deferred as list_technology;
import '../widgets/work/list_works_widget.dart' deferred as list_work;
import 'package:web/web.dart' as web;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _headerKey = GlobalKey();
  late final List<GlobalKey> _listGlobalKey;
  late final List<Widget> _listWidgetHome;
  bool isComplete = false;
  bool _changeTop = false;
  bool moveTop = false;
  bool isActiveMove = false;
  Offset _mousePosition = Offset.zero;
  Offset? _mousePositionSecond;

  void _callUpdateNavigation() =>
      context.read<AppBannerTopCubit>().updateNavigationEvent(
          data: ResponsiveBreakpoints.of(context), headerKey: _headerKey);

  void _scrollListener() {
    if (_changeTop ==
        context.read<AppBannerTopCubit>().state.isActiveBannerTop) {
      return;
    }
    setState(() {
      _changeTop = context.read<AppBannerTopCubit>().state.isActiveBannerTop;
    });
  }

  void _reset() => setState(() {
        _mousePositionSecond = null;
        _mousePosition = Offset.zero;
        moveTop = false;
        isActiveMove = false;
      });

  void _onResize() {
    if (!isActiveMove) return;
    if (ResponsiveBreakpoints.of(context).isMobile && isActiveMove) {
      _reset();
    } else {
      setState(() {
        _mousePosition = Offset(
          _mousePosition.dx
              .clamp(0, web.window.innerWidth - 300), // Ancho del widget
          _mousePosition.dy.clamp(0, web.window.innerHeight - 100),
        );
      });
    }
  }

  void _scrollToItem(GlobalKey key) =>
      Scrollable.ensureVisible(key.currentContext!,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

  void _onDobleTap() {
    if (ResponsiveBreakpoints.of(context).isMobile) return;
    if (_mousePositionSecond == null) return;
    if (!isActiveMove) {
      isActiveMove = true;
    }
    setState(() {
      _mousePosition = _mousePositionSecond!;
      moveTop = !moveTop;
    });
  }

  void _onHover(dynamic event) {
    if (ResponsiveBreakpoints.of(context).isMobile) return;
    _mousePositionSecond =
        Offset(event.position.dx - 100, event.position.dy - 50);
    if (!moveTop) return;
    setState(() {
      _mousePosition = Offset(event.position.dx - 100, event.position.dy - 50);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() => _callUpdateNavigation());
    _scrollController.removeListener(() => _scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initializePage() async {
    if (isComplete) return;
    await Future.wait([
      background_animated.loadLibrary(),
      home.loadLibrary(),
      list_work.loadLibrary(),
      list_technology.loadLibrary(),
      projects.loadLibrary(),
      header.loadLibrary(),
      about_me.loadLibrary(),
      footer.loadLibrary(),
      contact_me.loadLibrary(),
      title.loadLibrary(),
      certificate.loadLibrary(),
      menu_items.loadLibrary()
    ]);
    _listGlobalKey = [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey()
    ];
    _listWidgetHome = [
      header.HeaderWidget(
          assetImageUser: const AssetImage("assets/images/personal.webp"),
          activationKey: _headerKey),
      title.SliverTitleHome(
          key: _listGlobalKey[0], menuItem: menu_items.MenuItems.EXPERIENCE),
      list_work.WorkWidget(),
      title.SliverTitleHome(
          key: _listGlobalKey[1], menuItem: menu_items.MenuItems.CERTIFICATE),
      certificate.CarrouselCertificate(),
      projects.TopBannerListProjectWidget(key: _listGlobalKey[2]),
      projects.MasonrySliver(),
      title.SliverTitleHome(
          key: _listGlobalKey[3], menuItem: menu_items.MenuItems.KNOWLEDGE),
      list_technology.ListTechnology(),
      title.SliverTitleHome(
          menuItem: menu_items.MenuItems.ABOUT_ME, key: _listGlobalKey[4]),
      about_me.AboutMeWidget(),
      title.SliverTitleHome(
          menuItem: menu_items.MenuItems.CONTACT_ME, key: _listGlobalKey[5]),
      contact_me.ContactToMeWidget(),
      footer.FooterWidget()
    ];
    web.window.addEventListener(
        'resize',
        () {
          if (isComplete) return;
          _callUpdateNavigation();
          _onResize();
        }.toJS);
    _scrollController.addListener(() {
      _callUpdateNavigation();
      _scrollListener();
    });
    setState(() {
      isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return isComplete
            ? home.HomeScreen(
                particleOptions: background_animated.ParticleOptions(
                    baseColor: Colors.blue,
                    opacityChangeRate: 0.30,
                    minOpacity: state.isDarkMode() ? 0.11 : 0.08,
                    maxOpacity: state.isDarkMode() ? 0.45 : 0.13,
                    spawnMinSpeed: 20.0,
                    spawnMaxSpeed: 30.0,
                    spawnMinRadius: 7.0,
                    spawnMaxRadius: 30.0,
                    particleCount:
                        ResponsiveBreakpoints.of(context).isMobile ? 5 : 7),
                scrollController: _scrollController,
                listWidgetHome: _listWidgetHome,
                scrollNavigation: (value) {
                  if (value != null) {
                    _scrollToItem(_listGlobalKey[value]);
                  }
                },
                vsync: this,
                changeTop: _changeTop,
                moveTop: moveTop,
                isActiveMove: isActiveMove,
                mousePosition: _mousePosition,
                reset: isActiveMove ? () => _reset() : null,
                onDobleTap: () => _onDobleTap(),
                onHover: (event) => _onHover(event))
            : FutureBuilder<void>(
                future: _initializePage(),
                builder: (context, snapshot) => const Scaffold(
                    body: Center(child: CircularProgressIndicator())));
      },
    );
  }
}
