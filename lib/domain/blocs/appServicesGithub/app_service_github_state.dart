part of 'app_service_github_bloc.dart';

class AppServiceGithubState {
  final int allCountCommit;

  const AppServiceGithubState({required this.allCountCommit});

  factory AppServiceGithubState.init() {
    return const AppServiceGithubState(allCountCommit: 0);
  }

  AppServiceGithubState copyWitch({required int? allCountCommit}) {
    return AppServiceGithubState(
        allCountCommit: allCountCommit ?? this.allCountCommit);
  }
}
