import 'package:desafio/api/api_star_wars.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class LoadingPageListPageStarWars extends StatefulWidget {
  const LoadingPageListPageStarWars({Key? key}) : super(key: key);

  @override
  State<LoadingPageListPageStarWars> createState() =>
      _LoadingPageListPageStarWarsState();
}

class _LoadingPageListPageStarWarsState
    extends State<LoadingPageListPageStarWars> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      futureNavigator: StarWarApi().loadUserStarWars(),
      title: const Text("Carregando a lista de personagens"),
      logo: Image.asset('lib\\assets\\images\\light-saber.png'),
      backgroundColor: Colors.black,
      showLoader: true,
      loadingText: const Text(
        "Carregando. . . ",
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    );
  }
}
