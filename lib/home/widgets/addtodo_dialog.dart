import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/provider/todo_provider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _CitySearchDialogState();
}

class _CitySearchDialogState extends State<AddTodoDialog> {
  TextEditingController toDoController = TextEditingController();

  @override
  void dispose() {
    toDoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          const Text("Was muss du erledigen?", style: TextStyle(fontSize: 19)),
      content: TextField(
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        controller: toDoController,
        decoration: const InputDecoration(hintText: "ToDo Eingeben"),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Schließen")),
        TextButton(
            onPressed: () {
              final provider =
                  Provider.of<ToDoProvider>(context, listen: false);
              provider.addToDo(ToDo(
                title: toDoController.text,
                isDone: false,
              ));
              Navigator.of(context).pop();
            },
            child: const Text("Hinzufügen")),
      ],
    );
  }
}
