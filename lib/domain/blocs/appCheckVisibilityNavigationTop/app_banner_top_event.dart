part of 'app_banner_top_bloc.dart';

@immutable
sealed class AppBannerTopEvent {}
class UpdateNavigationEvent extends AppBannerTopEvent {
  final BuildContext context;
  final GlobalKey headerKey;

  UpdateNavigationEvent({required this.context, required this.headerKey});
}
