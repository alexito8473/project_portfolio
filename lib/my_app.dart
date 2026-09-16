import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_porfolio/presentation/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/blocs/appSendMessage/app_send_message_bloc.dart';
import 'domain/cubits/appBannerTop/app_banner_top_cubit.dart';
import 'domain/cubits/appLocale/app_locale_cubit.dart';
import 'domain/cubits/appTheme/app_theme_cubit.dart';
import 'domain/cubits/listTechnology/list_technology_cubit.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppBannerTopCubit()),
          BlocProvider(create: (context) => AppSendMessageBloc()),
          BlocProvider(create: (context) => ListTechnologyCubit()),
          BlocProvider(create: (context) => AppThemeCubit(prefs: prefs)),
          BlocProvider(create: (context) => AppLocaleCubit(locale: AppLocale.selectAppLocale(ui.PlatformDispatcher.instance.locale)))
        ],
        child: BlocSelector<AppThemeCubit, AppThemeState, AppTheme>(
            selector: (state) => state.appTheme,
            builder: (context, theme) {
              return BlocSelector<AppLocaleCubit, AppLocaleState, AppLocale>(
                selector: (state) => state.locale,
                builder: (context, locale) {
                  return MaterialApp.router(
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate
                      ],
                      locale: locale.getLocal(),
                      supportedLocales: const [Locale("en", ""), Locale("es", "")],
                      title: 'Portafolio de Alejandro Aguilar Alba | Desarrollador Full Stack & Mobile',
                      theme: theme.getThemeData(),
                      routerConfig: router,
                      builder: (context, child) => child!);
                },
              );
            }));
  }
}
