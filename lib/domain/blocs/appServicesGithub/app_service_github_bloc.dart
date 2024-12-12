import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/github_repository.dart' deferred as github;

part 'app_service_github_event.dart';
part 'app_service_github_state.dart';

class AppServiceGithubBloc
    extends Bloc<AppServiceGithubEvent, AppServiceGithubState> {
  AppServiceGithubBloc()
      : super(AppServiceGithubState.init()) {

    on<ConnectToGithub>((event, emit) async {
      await github.loadLibrary();
      emit(state.copyWitch(allCountCommit: await github.GithubRepository.init().fetchCommitCount()));
    });
  }
}
