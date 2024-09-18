part of 'app_service_github_bloc.dart';

class AppServiceGithubState {
  final String userName;
  final String tokenGithub;
  final int allCountCommit;
  const AppServiceGithubState(
      {required this.userName,
      required this.tokenGithub,
      required this.allCountCommit});

  factory AppServiceGithubState.init() {
    return AppServiceGithubState(
        userName: dotenv.env["NAME_GITHUB"]!,
        tokenGithub: dotenv.env["TOKEN_GITHUB"]!,
        allCountCommit: 0);
  }
  AppServiceGithubState copyWitch(
      {required String? userName,
      required String? tokenGithub,
      required int? allCountCommit}) {
    return AppServiceGithubState(
        userName: userName ?? this.userName,
        tokenGithub: tokenGithub ?? this.tokenGithub,
        allCountCommit: allCountCommit ?? this.allCountCommit);
  }
}
