import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_porfolio/models/Technology.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/listTechnology/list_technology_bloc.dart';
import 'package:proyect_porfolio/ui/pages/home_page.dart';
import 'package:proyect_porfolio/ui/utils/CreateListTechnology.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    isLightMode: prefs.getBool('isLightMode'),
    prefs: prefs,
    listTechnology: createListTechnology(),
  ));
}

class MyApp extends StatelessWidget {
  final bool? isLightMode;
  final SharedPreferences prefs;
  final List<Technology> listTechnology;

  const MyApp(
      {super.key,
      this.isLightMode,
      required this.prefs,
      required this.listTechnology});

  AppTheme selectMode(Brightness brightness) {
    switch (isLightMode) {
      case true:
        return AppTheme.LIGHT;
      case false:
        return AppTheme.DARK;
      case null:
        return brightness == Brightness.dark ? AppTheme.DARK : AppTheme.LIGHT;
    }
  }

  void preCacheImage(List<Technology> listTechnology, BuildContext context) async {
    await precacheImage(const AssetImage("assets/images/personal.jpeg"), context);
    for (int i = 0; i < listTechnology.length; i++) {
      await precacheImage(AssetImage(listTechnology[i].urlIcon), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    preCacheImage(listTechnology, context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ListTechnologyBloc(
                listTechnologyMobile: listTechnology
                    .where((element) =>
                        element.typeLanguage == TypeLanguage.MOBILE)
                    .toList(),
                listTechnologyBackend: listTechnology
                    .where((element) =>
                        element.typeLanguage == TypeLanguage.BACKEND)
                    .toList(),
                listTechnologyFrontend: listTechnology
                    .where((element) =>
                        element.typeLanguage == TypeLanguage.FRONTEND)
                    .toList(),
                listTechnologyLearning: listTechnology
                    .where((element) =>
                        element.typeLanguage == TypeLanguage.LEARNING)
                    .toList(),
                listTechnologyTools: listTechnology
                    .where(
                        (element) => element.typeLanguage == TypeLanguage.TOOLS)
                    .toList()),
          ),
          BlocProvider(
              create: (context) =>
                  AppThemeBloc(appTheme: selectMode(brightness), prefs: prefs)),
          BlocProvider(
              create: (context) => AppLocaleBloc(
                  locale: AppLocale.selectAppLocale(ui.window.locale))),
        ],
        child:
            BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            locale: context.watch<AppLocaleBloc>().state.locale.getLocal(),
            supportedLocales: const [Locale("en", ""), Locale("es", "")],
            debugShowCheckedModeBanner: false,
            title: 'Porfolio Alejandro',
            theme: state.appTheme.getTheme(),
            home: HomeScreen(),
          );
        }));
  }
}
