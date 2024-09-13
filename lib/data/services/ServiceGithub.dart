
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceGithub {
  static ServiceGithub? _instance;
  late String userName;
  late String tokenGithub;
  ServiceGithub.init() {
    userName = dotenv.env["NAME_GITHUB"]!;
    tokenGithub = dotenv.env["TOKEN_GITHUB"]!;
  }
  static ServiceGithub? getInstance() {
    return _instance ??= ServiceGithub.init();
  }

  Future<int> seeCommitGithub() async {
    int countCommits = 0;

    final userResponse = await http.get(
      Uri.parse('https://api.github.com/users/$userName'),
        headers: {
          'Authorization': 'token $tokenGithub',
        }
    );
    if (userResponse.statusCode == 200) {
      // Obtener los repositorios
      final reposResponse = await http.get(
        Uri.parse('https://api.github.com/users/$userName/repos'),
          headers: {
            'Authorization': 'token $tokenGithub',
          }
      );
      if (reposResponse.statusCode == 200) {
        var reposData = json.decode(reposResponse.body);
        for (var repo in reposData) {
          String repoName = repo['name'];

          // Obtener el número de commits en cada repositorio
          final commitsResponse = await http.get(
            Uri.parse(
                'https://api.github.com/repos/$userName/$repoName/stats/contributors'),
              headers: {
                'Authorization': 'token $tokenGithub',
              }
          );
          print(commitsResponse.statusCode);
          if (commitsResponse.statusCode == 200) {
            var contributorsData = json.decode(commitsResponse.body);
            countCommits += int.parse(contributorsData.toString().substring(8,10));
          }
        }
      }
    }
    return countCommits;
  }
}
