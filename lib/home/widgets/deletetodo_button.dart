import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_torsten/home/provider/todo_provider.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';

class DeleteAllToDoButton extends StatefulWidget {
  const DeleteAllToDoButton({super.key});

  @override
  State<DeleteAllToDoButton> createState() => _RefreshToDoButtonState();
}

final ToDoRepository toDoRepository = ToDoRepository();

class _RefreshToDoButtonState extends State<DeleteAllToDoButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final provider = Provider.of<ToDoProvider>(context, listen: false);
        provider.deleteToDo();
      },
      child: Column(
        children: [
          const Text("Delete All",
              style: TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                  fontWeight: FontWeight.bold)),
          Container(
            height: 2,
            width: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 177, 19, 48),
            ),
          ),
        ],
      ),
    );
  }
}
