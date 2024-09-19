import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc({required AppTheme appTheme, required SharedPreferences prefs})
      : super(AppThemeState.init(appTheme: appTheme, prefs: prefs)) {
    on<ChangeThemeEvent>((event, emit) async {
      await prefs.setBool(
          'isLightMode', state.appTheme.reverse() == AppTheme.LIGHT);
      emit(AppThemeState(
          appTheme: state.appTheme.reverse(),
          prefs: state.prefs,
          themeDataDark: state.themeDataDark,
          themeDataLight: state.themeDataLight));
    });
  }
}