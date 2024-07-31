import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../../models/CustomParticle.dart';
import '../utils/CreateListTechnology.dart';
import '../widgets/works_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/listTechnology_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  final Duration _durationAnimation = const Duration(milliseconds: 300);
  final ScrollController _scrollController = ScrollController();
  List<GlobalKey> listGlobalKey = [GlobalKey(), GlobalKey(), GlobalKey()];
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Widget? navigationUp({required bool haveTopNavigation, required Size size}) {
    if (!haveTopNavigation) {
      return null;
    }
    return Container(
        height: 80,
        margin: EdgeInsets.only(
          left: size.width * 0.34,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  scrollToItem(listGlobalKey[0]);
                },
                icon: Text(AppLocalizations.of(context)!.aboutMe,
                    style: const TextStyle(fontSize: 25))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () {
                    scrollToItem(listGlobalKey[1]);
                  },
                  icon: Text(AppLocalizations.of(context)!.technologies,
                      style: const TextStyle(fontSize: 25))),
            ),
            IconButton(
                onPressed: () {
                  scrollToItem(listGlobalKey[2]);
                },
                icon: Text(AppLocalizations.of(context)!.workExperience,
                    style: const TextStyle(fontSize: 25))),
          ],
        ));
  }

  Widget? navigationBottom({required bool haveNavigation, required Size size}) {
    if (haveNavigation) {
      return null;
    }
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      margin: EdgeInsets.only(
          bottom: 20, left: size.width * 0.1, right: size.width * 0.1),
      child: BottomNavigationBar(
        elevation: 20,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        onTap: (value) {
          scrollToItem(listGlobalKey[value]);
        },
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: "Sobre mi",
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "Tecnologias",
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "hola",
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isTopNavigation = size.width > 1050;
    bool isMobile = size.width > 750;
    double spacePadding = isMobile ? size.width * 0.03 : size.width * 0.01;
    double spaceFinal =
        size.width > 1200 ? size.width * 0.6 : size.width * 0.75;

    return Scaffold(
        extendBody: true,
        bottomNavigationBar:
            navigationBottom(haveNavigation: isTopNavigation, size: size),
        appBar: AppBar(
          flexibleSpace:
              navigationUp(haveTopNavigation: isTopNavigation, size: size),
          shadowColor: Colors.black,
          toolbarHeight: 80,
          title: AnimatedPadding(
              duration: _durationAnimation,
              padding: EdgeInsets.only(left: spacePadding),
              child: const Text(
                "Software developer",
                style: TextStyle(fontSize: 30),
              )),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AppLocaleBloc>().add(ChangeLocalEvent());
                },
                icon: Text(
                    context
                        .watch<AppLocaleBloc>()
                        .state
                        .locale
                        .getLenguajeCode(),
                    style: const TextStyle(fontSize: 25))),
            AnimatedPadding(
              duration: _durationAnimation,
              padding:
                  EdgeInsets.only(left: size.width * 0.01, right: spacePadding),
              child: IconButton(
                  onPressed: () {
                    context.read<AppThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
            ),
          ],
        ),
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: AnimatedBackground(
                behaviour: CustomParticle().setOptions(context),
                vsync: this,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeaderWidget(
                        key: listGlobalKey[0],
                        size: size,
                        spaceFinal: spaceFinal,
                        isMobile: isMobile,
                        durationAnimation: _durationAnimation,
                      ),
                      TechnologyWidget(
                        key: listGlobalKey[1],
                        size: size,
                        spaceFinal: spaceFinal,
                        listTechnology: createListTechnology(context),
                        durationAnimation: _durationAnimation,
                      ),
                      EducationWidget(
                        key: listGlobalKey[2],
                        spaceFinal: spaceFinal,
                        size: size,
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                  ),
                ))));
  }
}
