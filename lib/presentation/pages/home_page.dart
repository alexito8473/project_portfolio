import 'dart:js_interop';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/data/dataSource/work_data.dart';
import 'package:proyect_porfolio/domain/cubits/appBannerTop/app_banner_top_cubit.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';
import 'package:web/web.dart' as web;

import '../../data/dataSource/menu_items.dart';
import '../screens/home_screens.dart';
import '../widgets/aboutMe/about_me_widget.dart';
import '../widgets/certificate/type_carrousel_certificate_widget.dart';
import '../widgets/contact/contact_me_widget.dart';
import '../widgets/customWidget/title_custom.dart';
import '../widgets/footer/footer_widget.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/project/project_widget.dart';
import '../widgets/technology/list_technology_widget.dart';
import '../widgets/work/list_works_widget.dart';

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

  bool _isComplete = false;
  bool _changeTop = false;
  bool _moveTop = false;
  bool _isActiveMove = false;
  Offset _mousePosition = Offset.zero;
  Offset? _mousePositionSecond;

  @override
  void initState() {
    // TODO: implement initState
    _initializePage();
  }

  void _callUpdateNavigation() =>
      context.read<AppBannerTopCubit>().updateNavigationEvent(
          size: MediaQuery.sizeOf(context), headerKey: _headerKey);

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
        _moveTop = false;
        _isActiveMove = false;
      });

  void _onResize() {
    if (!_isActiveMove) return;
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context)) && _isActiveMove) {
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
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context))) return;
    if (_mousePositionSecond == null) return;
    if (!_isActiveMove) {
      _isActiveMove = true;
    }
    setState(() {
      _mousePosition = _mousePositionSecond!;
      _moveTop = !_moveTop;
    });
  }

  void _onHover(dynamic event) {
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context))) return;
    _mousePositionSecond =
        Offset(event.position.dx - 100, event.position.dy - 50);
    if (!_moveTop) return;
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
    if (_isComplete) return;
    _listGlobalKey = [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey()
    ];

    _listWidgetHome = [
      HeaderWidget(
          assetImageUser: const AssetImage("assets/images/personal.webp"),
          activationKey: _headerKey),
      SliverTitleHome(key: _listGlobalKey[0], menuItem: MenuItems.EXPERIENCE),
      WorkWidget(listWork: WorkData.generateWorks()),
      SliverTitleHome(key: _listGlobalKey[1], menuItem: MenuItems.CERTIFICATE),
      TypeCarrouselCertificate(),
      TopBannerListProjectWidget(key: _listGlobalKey[2]),
      MasonrySliver(),
      SliverTitleHome(key: _listGlobalKey[3], menuItem: MenuItems.KNOWLEDGE),
      ListTechnology(),
      SliverTitleHome(menuItem: MenuItems.ABOUT_ME, key: _listGlobalKey[4]),
      AboutMeWidget(),
      SliverTitleHome(menuItem: MenuItems.CONTACT_ME, key: _listGlobalKey[5]),
      ContactToMeWidget(),
      FooterWidget()
    ];
    web.window.addEventListener(
        'resize',
        () {
          _callUpdateNavigation();
          _onResize();
        }.toJS);
    _scrollController.addListener(() {
      _callUpdateNavigation();
      _scrollListener();
    });
    setState(() {
      _isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return HomeScreen(
            particleOptions: ParticleOptions(
                baseColor: Colors.blue,
                opacityChangeRate: 0.30,
                    minOpacity: state.appTheme.isDarkMode() ? 0.11 : 0.08,
                    maxOpacity: state.appTheme.isDarkMode() ? 0.45 : 0.13,
                    spawnMinSpeed: 20.0,
                    spawnMaxSpeed: 30.0,
                    spawnMinRadius: 7.0,
                    spawnMaxRadius: 30.0,
                    particleCount: CalculateSize.isMobile(MediaQuery.sizeOf(context)) ? 5 : 7),
            scrollController: _scrollController,
                listWidgetHome: _listWidgetHome,
                scrollNavigation: (value) {
                  if (value != null) {
                    _scrollToItem(_listGlobalKey[value]);
                  }
                },
                vsync: this,
                changeTop: _changeTop,
                moveTop: _moveTop,
                isActiveMove: _isActiveMove,
                mousePosition: _mousePosition,
                reset: _isActiveMove ? () => _reset() : null,
                onDobleTap: () => _onDobleTap(),
            onHover: (event) => _onHover(event));
      },
    );
  }
}
