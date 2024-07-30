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
        return ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: Colors.blueAccent,
                onPrimary: Colors.blue,
                secondary: Colors.blue,
                onSecondary: Colors.blue,
                error: Colors.white,
                onError: Colors.white,
                surface: Colors.grey.shade50,
                onSurface: Colors.black));

      case AppTheme.DARK:
        return ThemeData.from(
            useMaterial3: true,
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Colors.grey,
                onPrimary: Colors.red,
                secondary: Colors.red,
                onSecondary: Colors.red,
                error: Colors.white,
                onError: Colors.white,
                surface: Colors.black,
                onSurface: Colors.white));
        return ThemeData.dark(useMaterial3: true);
    }
  }

  Icon getIcon() {
    switch (this) {
      case AppTheme.LIGHT:
        return const Icon(
          Icons.light_mode,
          size: 30.0,
        );
      case AppTheme.DARK:
        return const Icon(Icons.dark_mode, size: 30.0);
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
