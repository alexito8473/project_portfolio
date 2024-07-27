import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeState.init()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(AppThemeState(appTheme: state.appTheme.reverse()));
    });
  }
}
