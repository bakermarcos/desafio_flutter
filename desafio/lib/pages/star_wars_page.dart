import 'package:desafio/api/api_star_wars.dart';
import 'package:desafio/model/star_wars_model.dart';
import 'package:desafio/pages/star_wars_personagem_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StarWarsPage extends StatefulWidget {
  List<UserStarWars>? listaPersonagens;
  StarWarsPage({this.listaPersonagens, Key? key}) : super(key: key);

  @override
  State<StarWarsPage> createState() => _StarWarsPageState();
}

class _StarWarsPageState extends State<StarWarsPage> {
  final pesquisaController = TextEditingController();
  StarWarApi? usersApi = StarWarApi();
  String? pesquisa = ' ';
  List<UserStarWars> listaPersnonagemPesquisado = [];
  String infoLista = "Carregar mais Personagens";
  void clearPesquisa() {
    if (pesquisa == ' ') {
      setState(() {
        listaPersnonagemPesquisado.removeRange(
            0, listaPersnonagemPesquisado.length);
      });
    }
  }

  void _filtrar(String pesquisa) {
    if (pesquisa.isNotEmpty) {
      setState(() {
        listaPersnonagemPesquisado = widget.listaPersonagens!
            .where((user) =>
                user.name!.toLowerCase().contains(pesquisa.toLowerCase()))
            .toList();
      });
    }
  }

  void _atualizarLista() async {
    setState(() {
      infoLista = "Carregando . . .";
    });
    widget.listaPersonagens = List.from(widget.listaPersonagens!)
      ..addAll(await usersApi!.carregarMaisPersonagens(
          usersApi!.nextPage, widget.listaPersonagens!));
    setState(() {
      infoLista = "Carregar mais Personagens";
    });
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 320,
                      child: TextFormField(
                        controller: pesquisaController,
                        onChanged: (_) {
                          clearPesquisa();
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Adicionar"),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _filtrar(pesquisaController.text);
                    },
                    child: const SizedBox(
                      width: 70,
                      height: 70,
                      child: Card(
                        color: Colors.red,
                        child: Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: pesquisaController.text.isEmpty
                        ? widget.listaPersonagens!.length
                        : listaPersnonagemPesquisado.length,
                    itemBuilder: (BuildContext context, index) {
                      return pesquisaController.text.isEmpty
                          ? SizedBox(
                              height: 70,
                              child: Card(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      widget.listaPersonagens!
                                          .elementAt(index)
                                          .name!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StarWarsPersonagemPage(
                                            user: widget.listaPersonagens!
                                                .elementAt(index),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.info,
                                      size: 25,
                                    ),
                                    color: Colors.red,
                                  )
                                ],
                              )),
                            )
                          : SizedBox(
                              height: 70,
                              child: Card(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      listaPersnonagemPesquisado
                                          .elementAt(index)
                                          .name!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StarWarsPersonagemPage(
                                            user: listaPersnonagemPesquisado
                                                .elementAt(index),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.info),
                                    color: Colors.red,
                                  )
                                ],
                              )),
                            );
                    }),
              ),
              listaPersnonagemPesquisado.isEmpty
                  ? TextButton(
                      onPressed: () {
                        _atualizarLista();
                      },
                      child: Center(
                        child: Text(
                          infoLista,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : const Text('')
            ],
          ),
        ));
  }
}
