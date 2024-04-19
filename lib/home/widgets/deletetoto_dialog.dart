import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_torsten/home/provider/todo_provider.dart';

class DeleteTodoDialog extends StatefulWidget {
  const DeleteTodoDialog({super.key});

  @override
  State<DeleteTodoDialog> createState() => _DeleteTodoDialogState();
}

class _DeleteTodoDialogState extends State<DeleteTodoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("ToDo's wirklich löschen?",
          style: TextStyle(fontSize: 19)),
      content:
          const Text("Du löscht unwiderruflich alle ToDo's. Bist du sicher?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Stoppen")),
        TextButton(
            onPressed: () async {
              final provider =
                  Provider.of<ToDoProvider>(context, listen: false);
              provider.deleteAllToDo();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Alle ToDo's wurden gelöscht!"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text("Delete it all!")),
      ],
    );
  }
}
