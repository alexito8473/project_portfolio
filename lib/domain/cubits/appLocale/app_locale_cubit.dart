import 'dart:ui';

import 'package:bloc/bloc.dart';

part 'app_locale_state.dart';

class AppLocaleCubit extends Cubit<AppLocaleState> {
  AppLocaleCubit({required AppLocale locale}) : super(AppLocaleState(locale: locale));
  void changeLocal() {
    emit(AppLocaleState(locale: state.locale.reverse()));
  }
}
