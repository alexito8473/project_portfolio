import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
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

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  late final List<Widget> _listWidgetHome = [
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

  late final List<GlobalKey> _listGlobalKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  final GlobalKey _headerKey = GlobalKey();

  @override
  void initState() {
    context.read<AppServiceGithubBloc>().add(ConnectToGithub());
    html.window.onResize.listen((event) {
      callUpdateNavigation();
    },);
    super.initState();
  }
  void callUpdateNavigation(){
    BlocProvider.of<AppBannerTopBloc>(context)
      .add(UpdateNavigationEvent(context: context, headerKey: _headerKey));
  }
  void scrollToItem(GlobalKey key) =>
      Scrollable.ensureVisible(key.currentContext!,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
        scrollController: _scrollController,
        updateNavigationEvent:
            UpdateNavigationEvent(context: context, headerKey: _headerKey),
        listWidgetHome: _listWidgetHome,
        scrollNavigation: (value) {
          if (value != null) {
            scrollToItem(_listGlobalKey[value]);
          }
        });
  }
}
