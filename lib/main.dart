import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_porfolio/models/Project.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/structure/cubits/listTechnology/list_technology_cubit.dart';
import 'package:proyect_porfolio/ui/pages/home_page.dart';

import 'package:proyect_porfolio/ui/widgets/header_widegt.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

AppTheme selectMode(Brightness brightness, bool? isLightMode) {
  switch (isLightMode) {
    case true:
      return AppTheme.LIGHT;
    case false:
      return AppTheme.DARK;
    case null:
      return brightness == Brightness.dark ? AppTheme.DARK : AppTheme.LIGHT;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.ensureVisualUpdate();
  await dotenv.load(fileName: ".env");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(isLightMode: prefs.getBool('isLightMode'), prefs: prefs));
}

class MyApp extends StatelessWidget {
  final bool? isLightMode;
  final SharedPreferences prefs;
  const MyApp({super.key, this.isLightMode, required this.prefs});

  void preCacheImage(BuildContext context) async {
    await precacheImage(
        const AssetImage("assets/images/personal.webp"), context);
    for (var element in ProjectRelease.values) {
      await precacheImage(AssetImage(element.project.imgUrl), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    preCacheImage(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ListTechnologyCubit(),
          ),
          BlocProvider(
              create: (context) => AppThemeBloc(
                  appTheme: selectMode(brightness, isLightMode), prefs: prefs)),
          BlocProvider(
              create: (context) => AppLocaleBloc(
                  locale: AppLocale.selectAppLocale(
                      ui.PlatformDispatcher.instance.locale))),
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
              title: 'Portfolio Alejandro',
              theme: state.appTheme.getTheme(),
              builder: (context, child) =>
                  ResponsiveBreakpoints.builder(child: child!, breakpoints: [
                    const Breakpoint(start: 0, end: 600, name: "MOBILE"),
                    const Breakpoint(start: 600, end: 1100, name: "TABLET"),
                    const Breakpoint(
                        start: 1800, end: double.infinity, name: "DESKTOP"),
                  ]),
              home: const HomePage(bannerTop: HeaderTop()));
        }));
  }
}
