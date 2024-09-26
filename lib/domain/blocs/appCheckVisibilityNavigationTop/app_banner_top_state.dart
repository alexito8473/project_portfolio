part of 'app_banner_top_bloc.dart';

class AppBannerTopState {
  final bool isActiveBannerTop;

  const AppBannerTopState({required this.isActiveBannerTop});
  factory AppBannerTopState.init() {
    return const AppBannerTopState(isActiveBannerTop: false);
  }

  AppBannerTopState copyWitch(
      {required bool? isActiveBannerTop}) {
    return AppBannerTopState(
        isActiveBannerTop: isActiveBannerTop ?? this.isActiveBannerTop);
  }
}
