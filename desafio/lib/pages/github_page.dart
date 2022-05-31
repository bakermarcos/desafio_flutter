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
    imageUrl: 'lib\\assets\\images\\confuso.png', // lib/assets/images/confuso.png
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
                    child: Image.network( // Colocar Image.asset quando o caminho for um asset
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
