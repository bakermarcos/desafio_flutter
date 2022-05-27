import 'package:desafio/model/star_wars_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StarWarApi {
  StarWarApi();
  Future<UserStarWars> buscarPersonagens(int index) async {
    final response = await http
        .get(Uri.parse("https://swapi.dev/api/people/${index.toString()}/"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final UserStarWars user = UserStarWars.fromJson(dados);
      return user;
    } else {
      return UserStarWars(
          name: "Erro", altura: "Erro", massa: "Erro", nascimento: "Erro");
    }
  }
}
