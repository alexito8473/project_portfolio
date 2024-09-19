import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/data/dataSource/ProjectData.dart';
import 'package:proyect_porfolio/domain/repositories/GithubRepository.dart';
import 'package:proyect_porfolio/domain/repositories/SendMessageRepository.dart';
import 'package:proyect_porfolio/presentation/pages/home_page.dart';
import 'package:proyect_porfolio/domain/blocs/appCheckVisibilityNavigationTop/app_check_visibility_navigation_top_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appSendMessage/app_send_message_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  runApp(MyApp(isLightMode: prefs.getBool('isLightMode'), prefs: prefs));
}

class MyApp extends StatelessWidget {
  final bool? isLightMode;
  final SharedPreferences prefs;
  const MyApp({super.key, this.isLightMode, required this.prefs});

  AppTheme _selectMode(Brightness brightness, bool? isLightMode) {
    switch (isLightMode) {
      case true:
        return AppTheme.LIGHT;
      case false:
        return AppTheme.DARK;
      case null:
        return brightness == Brightness.dark ? AppTheme.DARK : AppTheme.LIGHT;
    }
  }

  void _preCacheImages(BuildContext context) {
    for (final project in ProjectRelease.values) {
      precacheImage(AssetImage(project.project.imgUrl), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    _preCacheImages(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppCheckVisibilityNavigationTopBloc()),
          BlocProvider(
              create: (context) => AppServiceGithubBloc(
                  githubRepository: GithubRepository.init())),
          BlocProvider(
              create: (context) => AppSendMessageBloc(
                  sendMessageRepository: SendMessageRepository.init())),
          BlocProvider(create: (context) => ListTechnologyCubit()),
          BlocProvider(
              create: (context) => AppThemeBloc(
                  appTheme: _selectMode(brightness, isLightMode),
                  prefs: prefs)),
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
              theme: state.getTheme(),
              builder: (context, child) =>
                  ResponsiveBreakpoints.builder(child: child!, breakpoints: [
                    const Breakpoint(start: 0, end: 600, name: "MOBILE"),
                    const Breakpoint(start: 600, end: 1100, name: "TABLET"),
                    const Breakpoint(
                        start: 1800, end: double.infinity, name: "DESKTOP")
                  ]),
              home: const HomePage());
        }));
  }
}
