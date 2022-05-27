import 'package:desafio/model/user_git_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class GitHubApi {
  GitHubApi();

  Future<UserGit> buscarPerfil(String perfil) async {
    final response =
        await http.get(Uri.parse("https://api.github.com/users/$perfil"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final UserGit perfilGit = UserGit.fromJson(dados);
      return perfilGit;
    } else {
      return UserGit(
          name: "Erro",
          usuario: "Erro",
          descricao: "Erro",
          imageUrl: "https://cdn-icons-png.flaticon.com/512/221/221755.png");
    }
  }
}
