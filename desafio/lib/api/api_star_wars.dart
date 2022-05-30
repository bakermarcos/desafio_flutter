import 'package:desafio/model/star_wars_model.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/star_wars_page.dart';

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

  List<UserStarWars> listUserStarWars = [];
  Future<Widget> loadUserStarWars() async {
    int i = 1;
    do {
      UserStarWars user = await StarWarApi().buscarPersonagens(i);
      user.id = i;
      listUserStarWars.add(user);
      i++;
      print(user.name);
    } while (i < 84);
    return Future.value(StarWarsPage(
      listaPersonagens: listUserStarWars,
    ));
  }
}
