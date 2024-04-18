import 'package:flutter/material.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({super.key});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  final ToDoRepository toDoRepository = ToDoRepository();
  ToDo? toDo;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(107, 76, 76, 76),
      child: ListTile(
        title: Text(toDo!.title, style: const TextStyle(color: Colors.white)),
        trailing: Checkbox(
            fillColor: const MaterialStatePropertyAll(Colors.white),
            checkColor: Colors.black,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
      ),
    );
  }
}
