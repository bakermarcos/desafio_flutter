import 'package:desafio/model/star_wars_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/star_wars_page.dart';

class StarWarApi {
  String url = "https://swapi.dev/api/people/";
  String nextPage = "https://swapi.dev/api/people/?page=2";

  StarWarApi();

  Future<List<UserStarWars>> buscarPersonagens() async {
    List<UserStarWars> listaPersonagens = [];

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final List<dynamic> dadosResults = dados['results'];
      listaPersonagens =
          dadosResults.map((dados) => UserStarWars.fromJson(dados)).toList();
    }
    return listaPersonagens;
  }

  Future<List<UserStarWars>> carregarMaisPersonagens(
      String? nextPage, List<UserStarWars> listaPersonagens) async {
    final response = await http.get(Uri.parse(nextPage!));
    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final List<dynamic> dadosResults = dados['results'];
      this.nextPage = dados["next"];
      listaPersonagens =
          dadosResults.map((dados) => UserStarWars.fromJson(dados)).toList();
    } else {}
    return listaPersonagens;
  }

  Future<Widget> loadUserStarWars() async {
    return Future.value(StarWarsPage(
      listaPersonagens: await StarWarApi().buscarPersonagens(),
    ));
  }
}
