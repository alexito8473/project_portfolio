part of 'app_theme_bloc.dart';

@immutable
sealed class AppThemeEvent {}

class ChangeThemeEvent extends AppThemeEvent{}