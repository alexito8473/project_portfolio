part of 'app_theme_bloc.dart';

enum AppTheme {
  LIGHT,
  DARK;

  AppTheme reverse() => this == AppTheme.LIGHT ? AppTheme.DARK : AppTheme.LIGHT;

  Icon getIcon() => this == AppTheme.LIGHT
      ? const Icon(Icons.light_mode, size: 30.0)
      : const Icon(Icons.dark_mode, size: 30.0);
}

class AppThemeState {
  final AppTheme appTheme;

  const AppThemeState({
    required this.appTheme,
  });

  factory AppThemeState.init({required SharedPreferences prefs}) {
    AppTheme appTheme;
    switch (prefs.getBool('isLightMode')) {
      case true:
        appTheme = AppTheme.LIGHT;
      case false || null:
        appTheme = AppTheme.DARK;
    }
    return AppThemeState(appTheme: appTheme);
  }

  bool isDarkMode() => appTheme == AppTheme.DARK;

  AppThemeState copyWitch({required AppTheme? appTheme}) =>
      AppThemeState(appTheme: appTheme ?? this.appTheme);
}
