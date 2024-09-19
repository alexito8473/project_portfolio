import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/GithubRepository.dart';

part 'app_service_github_event.dart';
part 'app_service_github_state.dart';

class AppServiceGithubBloc
    extends Bloc<AppServiceGithubEvent, AppServiceGithubState> {
  final GithubRepository githubRepository;
  AppServiceGithubBloc({required this.githubRepository})
      : super(AppServiceGithubState.init()) {
    on<ConnectToGithub>((event, emit) async {
      emit(state.copyWitch(
          allCountCommit: await githubRepository.fetchCommitCount()));
    });
  }
}
