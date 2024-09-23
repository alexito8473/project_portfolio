part of 'app_service_github_bloc.dart';

@immutable
sealed class AppServiceGithubEvent {}
class ConnectToGithub extends AppServiceGithubEvent {}
