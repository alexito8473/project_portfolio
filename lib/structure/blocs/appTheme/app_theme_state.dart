part of 'app_theme_bloc.dart';

enum AppTheme {
  LIGHT,
  DARK;

  AppTheme reverse() {
    switch (this) {
      case AppTheme.LIGHT:
        return AppTheme.DARK;
      case AppTheme.DARK:
        return AppTheme.LIGHT;
    }
  }

  ThemeData getTheme() {
    switch (this) {
      case AppTheme.LIGHT:
        return ThemeData.light();
      case AppTheme.DARK:
        return ThemeData.dark();
    }
  }

  Icon getIcon() {
    switch (this) {
      case AppTheme.LIGHT:
        return const Icon(Icons.light_mode,size: 30.0,);
      case AppTheme.DARK:
        return const Icon(Icons.dark_mode,size: 30.0);
    }
  }
}

class AppThemeState {
  final AppTheme appTheme;
  final SharedPreferences prefs;
  const AppThemeState({required this.appTheme, required this.prefs});
  factory AppThemeState.init(
      {required AppTheme appTheme, required SharedPreferences prefs}) {
    return AppThemeState(
      appTheme: appTheme,
      prefs: prefs,
    );
  }

  AppThemeState copyWitch(
      {required AppTheme? appTheme, required SharedPreferences? prefs}) {
    return AppThemeState(
        appTheme: appTheme ?? this.appTheme, prefs: prefs ?? this.prefs);
  }
}
