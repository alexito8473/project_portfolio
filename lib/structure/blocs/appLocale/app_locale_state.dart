part of 'app_locale_bloc.dart';

enum AppLocale {
  SPANISH(),
  ENGLISH();

  Locale getLocal() {
    switch (this) {
      case AppLocale.SPANISH:
        return const Locale("es");
      case AppLocale.ENGLISH:
        return const Locale("en");
    }
  }

  String flags() {
    switch (this) {
      case AppLocale.SPANISH:
        return "🇪🇸";
      case AppLocale.ENGLISH:
        return "🏴󠁧󠁢󠁥󠁮󠁧󠁿";
    }
  }

  String getFlagsAndLenguajeCode() {
    return "${flags()} ${getLenguajeCode()}";
  }

  AppLocale reverse() {
    switch (this) {
      case AppLocale.SPANISH:
        return AppLocale.ENGLISH;
      case AppLocale.ENGLISH:
        return AppLocale.SPANISH;
    }
  }

  String getLenguajeCode() {
    return getLocal().languageCode;
  }

  static AppLocale selectAppLocale(Locale locale) {
    if (locale.languageCode == const Locale("es").languageCode) {
      return AppLocale.SPANISH;
    }
    return AppLocale.ENGLISH;
  }
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
