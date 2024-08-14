part of 'app_locale_bloc.dart';

enum AppLocale {
  SPANISH(),
  ENGLISH();

  Locale getLocal() =>
      this == AppLocale.SPANISH ? const Locale("es") : const Locale("en");

  AppLocale reverse() =>
      this == AppLocale.SPANISH ? AppLocale.ENGLISH : AppLocale.SPANISH;

  String getLenguajeCode() => getLocal().languageCode;

  static AppLocale selectAppLocale(Locale locale) =>
      locale.languageCode == const Locale("es").languageCode
          ? AppLocale.SPANISH
          : AppLocale.ENGLISH;
}

class AppLocaleState {
  final AppLocale locale;
  AppLocaleState({required this.locale});
  factory AppLocaleState.init() {
    return AppLocaleState(locale: AppLocale.SPANISH);
  }
  AppLocaleState copyWith({required AppLocale? locale}) {
    return AppLocaleState(locale: locale ?? this.locale);
  }
}
