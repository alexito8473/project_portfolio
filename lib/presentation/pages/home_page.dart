import 'dart:js_interop';

import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/data/dataSource/certificate_data.dart';
import 'package:proyect_porfolio/data/dataSource/project_data.dart';
import 'package:proyect_porfolio/data/dataSource/tecnology_data.dart';
import 'package:proyect_porfolio/data/dataSource/work_data.dart';
import 'package:proyect_porfolio/domain/cubits/appBannerTop/app_banner_top_cubit.dart';
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
  final ParticleOptions particleOptions = const ParticleOptions(
    baseColor: Colors.blue,
    opacityChangeRate: 0.30,
    minOpacity: 0.08,
    maxOpacity: 0.45,
    spawnMinSpeed: 20.0,
    spawnMaxSpeed: 30.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 30.0,
    particleCount: 6,
  );
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _headerKey = GlobalKey();
  late final List<GlobalKey> _listGlobalKey;
  late final List<Widget> _listWidgetHome;

  bool _isComplete = false;
  final ValueNotifier<bool> _changeTop = ValueNotifier(false);
  final ValueNotifier<bool> _moveTop = ValueNotifier(false);
  final ValueNotifier<bool> _isActiveMove = ValueNotifier(false);
  final ValueNotifier<Offset> _mousePosition = ValueNotifier(Offset.zero);
  late final JSFunction _resizeCallback;
  final ValueNotifier<Offset?> _mousePositionSecond = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  void _callUpdateNavigation() => context.read<AppBannerTopCubit>().updateNavigationEvent(size: MediaQuery.sizeOf(context), headerKey: _headerKey);

  void _scrollListener() {
    if (_changeTop.value == context.read<AppBannerTopCubit>().state.isActiveBannerTop) {
      return;
    }
    _changeTop.value = context.read<AppBannerTopCubit>().state.isActiveBannerTop;
  }

  void _reset() {
    _mousePosition.value = Offset.zero;
    _moveTop.value = false;
    _isActiveMove.value = false;
    _mousePositionSecond.value = null;
  }

  void _onResize() {
    if (!_isActiveMove.value) return;
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context))) {
      _reset();
    } else {
      _mousePosition.value = Offset(
          _mousePosition.value.dx.clamp(0, web.window.innerWidth - 300), // Ancho del widget
          _mousePosition.value.dy.clamp(0, web.window.innerHeight - 100));
    }
  }

  void _scrollToItem(GlobalKey key) =>
      Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500), curve: Curves.linear);

  void _onDoubleTap() {
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context))) return;
    if (_mousePositionSecond.value == null) return;
    if (!_isActiveMove.value) {
      _isActiveMove.value = true;
    }
    _mousePosition.value = _mousePositionSecond.value!;
    _moveTop.value = !_moveTop.value;
  }

  void _onHover(dynamic event) {
    if (CalculateSize.isMobile(MediaQuery.sizeOf(context))) return;
    _mousePositionSecond.value = Offset(event.position.dx - 100, event.position.dy - 50);
    if (!_moveTop.value) return;
    _mousePosition.value = Offset(event.position.dx - 100, event.position.dy - 50);
  }

  @override
  void dispose() {
    web.window.removeEventListener('resize', _resizeCallback);
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _mousePosition.dispose();
    _moveTop.dispose();
    _isActiveMove.dispose();
    super.dispose();
  }

  Future<void> _initializePage() async {
    if (_isComplete) return;

    _listGlobalKey = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];

    _listWidgetHome = [
      HeaderWidget(assetImageUser: const AssetImage("assets/images/personal.webp"), activationKey: _headerKey),
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
    _resizeCallback = (() {
      _callUpdateNavigation();
      _onResize();
    }).toJS;
    web.window.addEventListener('resize', _resizeCallback);
    _scrollController.addListener(_handleScroll);
    await Future.value([
      ...List.generate(
        Certificate.values.length,
        (index) => precacheImage(
          AssetImage(Certificate.values[index].urlImg),
          context,
        ),
      ),
      ...List.generate(
        ProjectRelease.values.length,
        (index) => precacheImage(
          AssetImage(ProjectRelease.values[index].project.imgUrl),
          context,
        ),
      ),
      ...List.generate(Knowledge.values.length, (index) => rootBundle.loadString(Knowledge.values[index].technology.urlIcon)),
    ]);

    _isComplete = true;
  }

  void _handleScroll() {
    _callUpdateNavigation();
    _scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
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
      reset: () => _reset(),
      onDoubleTap: () => _onDoubleTap(),
      onHover: (event) => _onHover(event),
      particleOptions: particleOptions,
    );
  }
}
