part of 'app_theme_bloc.dart';

enum AppTheme {
  LIGHT,
  DARK;

  AppTheme reverse() => this == AppTheme.LIGHT ? AppTheme.DARK : AppTheme.LIGHT;

  ThemeData getTheme() => this == AppTheme.LIGHT
      ? ThemeData.from(
          useMaterial3: true,
          textTheme: GoogleFonts.texturinaTextTheme(Typography.blackCupertino),
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
              onSurface: Colors.black))
      : ThemeData.from(
          useMaterial3: true,
          textTheme: GoogleFonts.texturinaTextTheme(Typography.whiteCupertino),
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

  Icon getIcon() => this == AppTheme.LIGHT
      ? const Icon(Icons.light_mode, size: 30.0)
      : const Icon(Icons.dark_mode, size: 30.0);
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
  bool isDarkMode() => appTheme == AppTheme.DARK;
  AppThemeState copyWitch(
      {required AppTheme? appTheme, required SharedPreferences? prefs}) {
    return AppThemeState(
        appTheme: appTheme ?? this.appTheme, prefs: prefs ?? this.prefs);
  }
}
