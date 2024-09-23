part of 'app_theme_bloc.dart';

enum AppTheme {
  LIGHT,
  DARK;

  ThemeData getTheme() {
    switch (this) {
      case AppTheme.LIGHT:
        return ThemeData.from(
            useMaterial3: true,
            textTheme:
                GoogleFonts.texturinaTextTheme(Typography.blackCupertino),
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
      case AppTheme.DARK:
        return ThemeData.from(
            useMaterial3: true,
            textTheme:
                GoogleFonts.texturinaTextTheme(Typography.whiteMountainView),
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
  }

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
    AppTheme selectMode() {
      switch (prefs.getBool('isLightMode')) {
        case true:
          return AppTheme.LIGHT;
        case false || null:
          return AppTheme.DARK;
      }
    }

    return AppThemeState(appTheme: selectMode());
  }

  bool isDarkMode() => appTheme == AppTheme.DARK;

  ThemeData getTheme() => appTheme.getTheme();

  AppThemeState copyWitch({required AppTheme? appTheme}) =>
      AppThemeState(appTheme: appTheme ?? this.appTheme);
}
