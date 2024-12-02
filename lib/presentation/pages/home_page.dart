import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../data/dataSource/project_data.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
import '../../domain/blocs/appTheme/app_theme_bloc.dart';
import '../screens/home_screens.dart';
import '../widgets/contacMe/contact_me_widget.dart';
import '../widgets/footer/footer_widget.dart';
import '../widgets/header/about_me_widget.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/project/project_widget.dart';
import '../widgets/technology/list_technology_widget.dart';
import '../widgets/work/list_works_widget.dart';
import 'dart:html' as html;

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
  late ParticleOptions options;
  bool isComplete = false;
  bool _changeTop = false;
  bool moveTop = false;
  bool isActiveMove = false;
  Offset _mousePosition = Offset.zero;
  Offset? _mousePositionSecond;

  void _updateNavigation() => context
      .read<AppBannerTopBloc>()
      .add(UpdateNavigationEvent(context: context, headerKey: _headerKey));

  void _scrollListener() {
    if (_changeTop ==
        context.read<AppBannerTopBloc>().state.isActiveBannerTop) {
      return;
    }
    setState(() {
      _changeTop = context.read<AppBannerTopBloc>().state.isActiveBannerTop;
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
          _mousePosition.dx.clamp(
              0,
              ResponsiveBreakpoints.of(context).screenWidth -
                  300), // Ancho del widget
          _mousePosition.dy
              .clamp(0, ResponsiveBreakpoints.of(context).screenHeight - 100),
        );
      });
    }
  }

  void _callUpdateNavigation() => BlocProvider.of<AppBannerTopBloc>(context)
      .add(UpdateNavigationEvent(context: context, headerKey: _headerKey));

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
    _scrollController.removeListener(() => context
        .read<AppBannerTopBloc>()
        .add(UpdateNavigationEvent(context: context, headerKey: _headerKey)));
    _scrollController.removeListener(() => _scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initializePage() async {
    if (isComplete) return;
    options=ParticleOptions(
        baseColor: Colors.blue,
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
        ResponsiveBreakpoints.of(context).isMobile ? 6 : 10);
    _listGlobalKey = [
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
      EducationWidget(key: _listGlobalKey[0]),
      ListProject(key: _listGlobalKey[1]),
      const MasonrySliver(),
      ListTechnology(key: _listGlobalKey[2]),
      AboutMeWidget(key: _listGlobalKey[3]),
      ContactToMeWidget(key: _listGlobalKey[4]),
      const FooterWidget()
    ];
    context.read<AppServiceGithubBloc>().add(ConnectToGithub());
    html.window.onResize.listen(
      (event) {
        _callUpdateNavigation();
        _onResize();
      },
    );
    _scrollController.addListener(() {
      _updateNavigation();
      _scrollListener();
    });
    for (ProjectRelease release in ProjectRelease.values) {
      await precacheImage(AssetImage(release.project.imgUrl), context);
    }
    setState(() {
      isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isComplete
        ? HomeScreen(
            particleOptions: options,
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
            builder: (context, snapshot) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            });
  }
}
