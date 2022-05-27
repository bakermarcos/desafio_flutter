import 'package:desafio/pages/github_page.dart';
import 'package:desafio/pages/home_page.dart';
import 'package:desafio/pages/star_wars_page.dart';
import 'package:desafio/pages/todo_list_page.dart';
import 'package:desafio/rotas/rotas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          Rotas.HOME_PAGE: (_) => const HomePage(),
          Rotas.TO_DO_PAGE: (_) => const TodolistPage(),
          Rotas.STAR_WARS_PAGE: (_) => const StarWarsPage(),
          Rotas.GITHUB_PAGE: (_) => const GitHubPage(),
        });
  }
}
