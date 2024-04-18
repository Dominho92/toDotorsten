import 'package:flutter/material.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';
import 'package:todo_torsten/home/widgets/addtodo_dialog.dart';

class AddToDoButton extends StatefulWidget {
  const AddToDoButton({super.key});

  @override
  State<AddToDoButton> createState() => _AddToDoButtonState();
}

final ToDoRepository toDoRepository = ToDoRepository();

class _AddToDoButtonState extends State<AddToDoButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AddTodoDialog();
          },
        );
      },
      child: Column(
        children: [
          const Text("Add ToDo",
              style: TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                  fontWeight: FontWeight.bold)),
          Container(
            height: 2,
            width: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 15, 180, 111),
            ),
          ),
        ],
      ),
    );
  }
}
