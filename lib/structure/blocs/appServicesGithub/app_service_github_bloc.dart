import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'app_service_github_event.dart';
part 'app_service_github_state.dart';

class AppServiceGithubBloc
    extends Bloc<AppServiceGithubEvent, AppServiceGithubState> {
  AppServiceGithubBloc() : super(AppServiceGithubState.init()) {
    on<ConnectToGithub>((event, emit) async {
      int countCommits = 0;

      final userResponse = await http.get(
          Uri.parse('https://api.github.com/users/${state.userName}'),
          headers: {
            'Authorization': 'token ${state.tokenGithub}',
          });
      if (userResponse.statusCode == 200) {
        // Obtener los repositorios
        final reposResponse = await http.get(
            Uri.parse('https://api.github.com/users/${state.userName}/repos'),
            headers: {'Authorization': 'token ${state.tokenGithub}'});

        if (reposResponse.statusCode == 200) {
          var reposData = json.decode(reposResponse.body);
          for (var repo in reposData) {
            String repoName = repo['name'];
            // Obtener el número de commits en cada repositorio
            final commitsResponse = await http.get(
                Uri.parse(
                    'https://api.github.com/repos/${state.userName}/$repoName/stats/contributors'),
                headers: {
                  'Authorization': 'token ${state.tokenGithub}',
                });
            if (commitsResponse.statusCode == 200) {
              var contributorsData = json.decode(commitsResponse.body);
              for (var contributor in contributorsData) {
                countCommits += int.parse(contributor["total"].toString());
              }
            }
          }
        }
      }
      emit(AppServiceGithubState(userName: state.userName, tokenGithub: state.tokenGithub, allCountCommit: countCommits));
    });
  }
}
