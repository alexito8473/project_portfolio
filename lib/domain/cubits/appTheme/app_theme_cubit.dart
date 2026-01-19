import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit({required this.prefs})
      : super(AppThemeState.init(prefs: prefs));
  late final SharedPreferences? prefs;
  void changeTheme() async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    emit(AppThemeState(appTheme: state.appTheme.toggle()));
    await sharedPreferences.setBool('isLightMode', state.appTheme == AppTheme.LIGHT);
  }
}
