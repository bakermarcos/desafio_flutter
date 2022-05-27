import 'package:desafio/api/api_git_hub.dart';
import 'package:desafio/model/user_git_model.dart';
import 'package:flutter/material.dart';

class GitHubPage extends StatefulWidget {
  const GitHubPage({Key? key}) : super(key: key);

  @override
  State<GitHubPage> createState() => _GitHubPageState();
}

class _GitHubPageState extends State<GitHubPage> {
  final perfilController = TextEditingController();

  UserGit perfilGit = UserGit(
    name: "",
    usuario: "",
    descricao: "",
    imageUrl:
        "https://cdn-icons.flaticon.com/png/512/4192/premium/4192747.png?token=exp=1653671541~hmac=0eb6023baf8b05328a5c310625400a80",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GitHub Page")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      perfilGit.imageUrl!,
                    ),
                  ),
                ),
                Text('Usuário: ${perfilGit.usuario}',
                    style: const TextStyle(
                      fontSize: 24,
                    )),
                Text(
                  "Nome: ${perfilGit.name}",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Descrição: ${perfilGit.descricao}",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextFormField(
                      controller: perfilController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Procurar perfil"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      perfilGit =
                          await GitHubApi().buscarPerfil(perfilController.text);
                      setState(() {});
                    },
                    child: const Text(
                      "Buscar",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
