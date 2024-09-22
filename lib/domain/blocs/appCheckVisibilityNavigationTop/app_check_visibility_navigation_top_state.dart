part of 'app_check_visibility_navigation_top_bloc.dart';

class AppCheckVisibilityNavigationTopState {
  final bool isActiveBannerTop;

  const AppCheckVisibilityNavigationTopState({required this.isActiveBannerTop});

  factory AppCheckVisibilityNavigationTopState.init() {
    return const AppCheckVisibilityNavigationTopState(isActiveBannerTop: false);
  }

  AppCheckVisibilityNavigationTopState copyWitch(
      {required bool? isActiveBannerTop}) {
    return AppCheckVisibilityNavigationTopState(
        isActiveBannerTop: isActiveBannerTop ?? this.isActiveBannerTop);
  }
}
