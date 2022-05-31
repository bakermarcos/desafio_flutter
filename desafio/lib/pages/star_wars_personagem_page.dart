import 'package:desafio/model/star_wars_model.dart';
import 'package:flutter/material.dart';

class StarWarsPersonagemPage extends StatelessWidget {
  final UserStarWars? user;
  const StarWarsPersonagemPage({this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Personagem Page"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Nome: ${user!.name}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Altura: ${user!.altura}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Massa: ${user!.massa}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Nascimento:${user!.nascimento} ",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
