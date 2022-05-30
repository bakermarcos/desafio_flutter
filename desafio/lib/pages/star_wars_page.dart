import 'package:desafio/api/api_star_wars.dart';
import 'package:desafio/model/star_wars_model.dart';
import 'package:desafio/pages/star_wars_personagem_page.dart';
import 'package:flutter/material.dart';

class StarWarsPage extends StatefulWidget {
  const StarWarsPage({Key? key}) : super(key: key);

  @override
  State<StarWarsPage> createState() => _StarWarsPageState();
}

class _StarWarsPageState extends State<StarWarsPage> {
  final pesquisaController = TextEditingController();
  List<UserStarWars> listaPersonagens = [];

  _loadLista() async {
    int contador = 0;

    UserStarWars user = await StarWarApi().buscarPersonagens(contador);
    do {
      listaPersonagens.add(user);
    } while (user.name != "Erro");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadLista();
    super.initState();
  }

  _list() {
    return FutureBuilder(
        future: _loadLista(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: listaPersonagens.length,
              itemBuilder: (BuildContext context, index) {
                return SizedBox(
                  height: 70,
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(listaPersonagens[index].name!),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StarWarsPersonagemPage(
                                        user: listaPersonagens[index],
                                      )));
                        },
                        icon: const Icon(Icons.info),
                        color: Colors.red,
                      )
                    ],
                  )),
                );
              });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Star Wars Page"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: pesquisaController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Adicionar"),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              SizedBox(
                height: 450,
                child: _list(),
              ),
            ],
          ),
        ));
  }
}
