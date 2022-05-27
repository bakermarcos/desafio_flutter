import 'package:desafio/api/api_star_wars.dart';
import 'package:desafio/model/star_wars_model.dart';
import 'package:flutter/material.dart';

class StarWarsPage extends StatefulWidget {
  const StarWarsPage({Key? key}) : super(key: key);

  @override
  State<StarWarsPage> createState() => _StarWarsPageState();
}

class _StarWarsPageState extends State<StarWarsPage> {
  TextEditingController pesquisaController = TextEditingController();
  List<UserStarWars> listaPersonagens = [];

  _loadList() async {
    for (int i = 0; i < 83; i++) {
      UserStarWars user = await StarWarApi().buscarPersonagens(i);
      listaPersonagens.add(user);
    }

    _list() {
      return FutureBuilder(
          future: _loadList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          height: 80,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              controller: pesquisaController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Procurar"),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ListView.builder(
                          itemCount: listaPersonagens.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              child: Card(
                                  child: Row(
                                children: [
                                  Text(listaPersonagens[index].name!),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.info_outline_sharp))
                                ],
                              )),
                            );
                          }),
                    )
                  ]),
            );
          });
    }

    @override
    void initState() {
      _loadList();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Star Wars Page"),
        ),
        body: _list(),
      );
    }
  }
}
