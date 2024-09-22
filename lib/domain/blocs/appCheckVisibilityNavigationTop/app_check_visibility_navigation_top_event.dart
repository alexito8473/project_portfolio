part of 'app_check_visibility_navigation_top_bloc.dart';

@immutable
sealed class AppCheckVisibilityNavigationTopEvent {}

class UpdateNavigationEvent extends AppCheckVisibilityNavigationTopEvent {
  final BuildContext context;
  final GlobalKey headerKey;

  UpdateNavigationEvent({required this.context, required this.headerKey});
}
