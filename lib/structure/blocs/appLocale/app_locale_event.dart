part of 'app_locale_bloc.dart';

@immutable
sealed class AppLocaleEvent {}

class ChangeLocalEvent extends AppLocaleEvent {}
