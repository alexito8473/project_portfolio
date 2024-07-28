import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_locale_event.dart';
part 'app_locale_state.dart';

class AppLocaleBloc extends Bloc<AppLocaleEvent, AppLocaleState> {
  AppLocaleBloc({required AppLocale locale})
      : super(AppLocaleState(locale: locale)) {
    on<ChangeLocalEvent>((event, emit) {
      emit(AppLocaleState(locale: state.locale.reverse()));
    });
  }
}
