import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_porfolio/domain/blocs/appCheckVisibilityNavigationTop/app_banner_top_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appSendMessage/app_send_message_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appServicesGithub/app_service_github_bloc.dart';
import 'package:proyect_porfolio/domain/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
import 'package:proyect_porfolio/domain/repositories/github_repository.dart';
import 'package:proyect_porfolio/domain/repositories/send_message_repository.dart';
import 'package:proyect_porfolio/presentation/route/route.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp(prefs: await SharedPreferences.getInstance()));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppBannerTopBloc()),
          BlocProvider(
              create: (context) => AppSendMessageBloc(
                  sendMessageRepository: SendMessageRepository.init())),
          BlocProvider(create: (context) => ListTechnologyCubit()),
          BlocProvider(create: (context) => AppThemeBloc(prefs: prefs)),
          BlocProvider(
              create: (context) => AppServiceGithubBloc(
                  githubRepository: GithubRepository.init())),
          BlocProvider(
              create: (context) => AppLocaleBloc(
                  locale: AppLocale.selectAppLocale(
                      ui.PlatformDispatcher.instance.locale))),
        ],
        child:
            BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, state) {
          return MaterialApp.router(
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
              routerConfig: router,
              builder: (context, child) =>
                  ResponsiveBreakpoints.builder(child: child!, breakpoints: [
                    const Breakpoint(start: 0, end: 600, name: "MOBILE"),
                    const Breakpoint(start: 600, end: 1100, name: "TABLET"),
                    const Breakpoint(
                        start: 1800, end: double.infinity, name: "DESKTOP")
                  ]));
        }));
  }
}
