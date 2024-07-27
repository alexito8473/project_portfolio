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
        return Icon(Icons.light_mode);
      case AppTheme.DARK:
        return Icon(Icons.dark_mode);
    }
  }
}

class AppThemeState {
  final AppTheme appTheme;
  const AppThemeState({required this.appTheme});
  factory AppThemeState.init() {
    return const AppThemeState(appTheme: AppTheme.LIGHT);
  }

  AppThemeState copyWith({required AppTheme? appTheme}) {
    return AppThemeState(appTheme: appTheme ?? this.appTheme);
  }
}
