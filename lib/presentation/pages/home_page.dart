import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../data/dataSource/MenuItems.dart';
import '../../domain/blocs/appCheckVisibilityNavigationTop/app_check_visibility_navigation_top_bloc.dart';
import '../screens/home_screens.dart';
import '../widgets/header/aboutMe_widget.dart';
import '../widgets/contacMe/contactToMe_Widget.dart';
import '../widgets/footer/footer_widget.dart';
import '../widgets/header/header_widegt.dart';
import '../widgets/technology/listTechnology.dart';
import '../widgets/project/project_widget.dart';
import '../widgets/work/listWorks_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late final List<Widget> _listWidgetHome;
  late final List<GlobalKey> _listGlobalKey;
  final GlobalKey _headerKey = GlobalKey();

  @override
  void initState() {
    context.read<AppServiceGithubBloc>().add(ConnectToGithub());
    loadWidget();
    super.initState();
  }

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Widget topNavigation() {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveBreakpoints.of(context).screenWidth * 0.035),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveBreakpoints.of(context).isMobile
                  ? const Expanded(
                      child: AutoSizeText("Full Stack Developer",
                          style: TextStyle(fontSize: 25), maxLines: 1))
                  : const AutoSizeText("Full Stack Developer",
                      style: TextStyle(fontSize: 28), maxLines: 1),
              if (context
                      .watch<AppCheckVisibilityNavigationTopBloc>()
                      .state
                      .isActiveBannerTop &&
                  !ResponsiveBreakpoints.of(context).isMobile)
                Expanded(child: FadeIn(child: const HeaderTop())),
              SizedBox(
                  width: ResponsiveBreakpoints.of(context).isMobile ? 150 : 180,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () => context
                                .read<AppLocaleBloc>()
                                .add(ChangeLocalEvent()),
                            icon: Text(
                                context
                                    .watch<AppLocaleBloc>()
                                    .state
                                    .locale
                                    .getLenguajeCode(),
                                style: const TextStyle(fontSize: 25))),
                        IconButton(
                            onPressed: () => context
                                .read<AppThemeBloc>()
                                .add(ChangeThemeEvent()),
                            icon: context
                                .watch<AppThemeBloc>()
                                .state
                                .appTheme
                                .getIcon()),
                        DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                customButton: const Icon(Icons.list, size: 38),
                                items: List.generate(
                                  MenuItems.values.length,
                                  (index) {
                                    return DropdownMenuItem<int>(
                                        value: index,
                                        child: MenuItems.values[index]
                                            .buildItem(context));
                                  },
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    scrollToItem(_listGlobalKey[value]);
                                  }
                                },
                                barrierColor: Colors.black.withOpacity(0.4),
                                dropdownStyleData: DropdownStyleData(
                                    width: 170,
                                    useSafeArea: true,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: context
                                                .watch<AppThemeBloc>()
                                                .state
                                                .isDarkMode()
                                            ? Colors.grey.shade800
                                            : Colors.blueAccent))))
                      ]))
            ],
          ),
        ));
  }

  void loadWidget() {
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
      AboutMeWidget(key: _listGlobalKey[0]),
      EducationWidget(key: _listGlobalKey[1]),
      ListProject(key: _listGlobalKey[2]),
      ListTechnology(key: _listGlobalKey[3]),
      ContactToMeWidget(key: _listGlobalKey[4]),
      const FooterWidget()
    ];
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppCheckVisibilityNavigationTopBloc>(context)
        .add(UpdateNavigationEvent(context: context, headerKey: _headerKey));
    return HomeScreen(
        scrollController: _scrollController,
        topNavigation: topNavigation(),
        updateNavigationEvent:
            UpdateNavigationEvent(context: context, headerKey: _headerKey),
        listWidgetHome: _listWidgetHome);
  }
}
