import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/screens/home_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    isLightMode: prefs.getBool('isLightMode'),
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isLightMode;
  final SharedPreferences prefs;
  const MyApp({super.key, this.isLightMode, required this.prefs});

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

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AppThemeBloc(appTheme: selectMode(brightness), prefs: prefs)),
          BlocProvider(
              create: (context) => AppLocaleBloc(
                  locale: AppLocale.selectAppLocale(ui.window.locale)))
        ],
        child:
            BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: context.watch<AppLocaleBloc>().state.locale.getLocal(),
            supportedLocales: const [Locale("en"), Locale("es")],
            debugShowCheckedModeBanner: false,
            title: 'Porfolio Alejandro',
            theme: state.appTheme.getTheme(),
            home: const HomeScreen(),
          );
        }));
  }
}
