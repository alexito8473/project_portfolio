import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyect_porfolio/domain/blocs/appSendMessage/app_send_message_bloc.dart';
import 'package:proyect_porfolio/domain/cubits/appBannerTop/app_banner_top_cubit.dart';
import 'package:proyect_porfolio/domain/cubits/appLocale/app_locale_cubit.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:proyect_porfolio/domain/cubits/listTechnology/list_technology_cubit.dart';
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
          BlocProvider(create: (context) => AppBannerTopCubit()),
          BlocProvider(create: (context) => AppSendMessageBloc()),
          BlocProvider(create: (context) => ListTechnologyCubit()),
          BlocProvider(create: (context) => AppThemeCubit(prefs: prefs)),
          BlocProvider(
              create: (context) => AppLocaleCubit(
                  locale: AppLocale.selectAppLocale(
                      ui.PlatformDispatcher.instance.locale)))
        ],
        child: BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
          return MaterialApp.router(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: context.watch<AppLocaleCubit>().state.locale.getLocal(),
              supportedLocales: const [Locale("en", ""), Locale("es", "")],
              title: 'Portfolio Alejandro',
              theme: state.appTheme.getThemeData(),
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
