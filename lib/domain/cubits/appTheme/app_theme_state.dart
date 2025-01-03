part of 'app_theme_cubit.dart';

enum AppTheme {
  LIGHT,
  DARK;

  AppTheme toggle() => this == AppTheme.LIGHT ? AppTheme.DARK : AppTheme.LIGHT;
  bool isDarkMode() => this == AppTheme.DARK;
  Icon getIcon() => this == AppTheme.LIGHT
      ? const Icon(Icons.light_mode, size: 25.0)
      : const Icon(Icons.dark_mode, size: 25.0);

  ThemeData getThemeData() {
    switch (this) {
      case DARK:
        {
          return ThemeData.from(
              useMaterial3: true,
              textTheme:
                  GoogleFonts.ralewayTextTheme(Typography.whiteMountainView),
              colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Colors.blueGrey,
                  onPrimary: Colors.blueAccent,
                  secondary: Colors.white,
                  onSecondary: Colors.white,
                  error: Colors.white,
                  onError: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.white));
        }
      case AppTheme.LIGHT:
        return ThemeData.from(
            useMaterial3: true,
            textTheme:
                GoogleFonts.ralewayTextTheme(Typography.blackMountainView),
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Colors.blueAccent,
                onPrimary: Colors.blue,
                secondary: Colors.blue,
                primaryContainer: Colors.blueAccent,
                onSecondary: Colors.blue,
                error: Colors.white,
                onError: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black));
    }
  }
}

class AppThemeState {
  final AppTheme appTheme;

  const AppThemeState({required this.appTheme});

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
  Color isDarkModeColor() =>
      appTheme.isDarkMode() ? Colors.white : Colors.black;

  AppThemeState copyWitch({required AppTheme? appTheme}) =>
      AppThemeState(appTheme: appTheme ?? this.appTheme);
}
