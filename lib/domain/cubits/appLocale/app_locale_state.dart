part of 'app_locale_cubit.dart';

enum AppLocale {
  SPANISH,
  ENGLISH;
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

  AppLocaleState copyWith({required AppLocale? locale}) =>
      AppLocaleState(locale: locale ?? this.locale);
}
