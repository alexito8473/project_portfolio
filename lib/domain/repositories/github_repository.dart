import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  final String userName;
  final String tokenGithub;

  GithubRepository._({required this.userName, required this.tokenGithub});

  factory GithubRepository.init() => GithubRepository._(
      userName: dotenv.env["NAME_GITHUB"]!,
      tokenGithub: dotenv.env["TOKEN_GITHUB"]!);

  Future<int> fetchCommitCount() async {
    int countCommits = 0;

    final reposResponse = await http.get(
      Uri.parse('https://api.github.com/users/$userName/repos'),
      headers: {
        'Authorization': 'token $tokenGithub',
      },
    );

    if (reposResponse.statusCode == 200) {
      var reposData = json.decode(reposResponse.body);
      for (var repo in reposData) {
        String repoName = repo['name'];

        final commitsResponse = await http.get(
          Uri.parse(
              'https://api.github.com/repos/$userName/$repoName/stats/contributors'),
          headers: {
            'Authorization': 'token $tokenGithub',
          },
        );

        if (commitsResponse.statusCode == 200) {
          var contributorsData = json.decode(commitsResponse.body);
          for (var contributor in contributorsData) {
            countCommits += int.parse(contributor["total"].toString());
          }
        }
      }
    }

    return countCommits;
  }
}
