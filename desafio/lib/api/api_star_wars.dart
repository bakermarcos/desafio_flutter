import 'package:desafio/model/star_wars_model.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/star_wars_page.dart';

class StarWarApi {
  StarWarApi();

  Future<List<UserStarWars>> buscarPersonagens() async {
    final response = await http.get(Uri.parse("https://swapi.dev/api/people/"));
    List<UserStarWars> listaPersonagens = [];
    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      final List<dynamic> dadosResults = dados['results'];
      listaPersonagens =
          dadosResults.map((dados) => UserStarWars.fromJson(dados)).toList();
    }

    return listaPersonagens;
  }

  Future<Widget> loadUserStarWars() async {
    return Future.value(StarWarsPage(
      listaPersonagens: await StarWarApi().buscarPersonagens(),
    ));
  }
}
