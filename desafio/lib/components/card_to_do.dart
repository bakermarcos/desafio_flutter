import 'package:desafio/model/to_do_model.dart';
import 'package:flutter/material.dart';

class CardToDo extends StatelessWidget {
  ToDo tarefa;
  CardToDo(this.tarefa, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(tarefa.name!),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_circle),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
