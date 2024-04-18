import 'package:flutter/material.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';

class RefreshToDoButton extends StatefulWidget {
  const RefreshToDoButton({super.key});

  @override
  State<RefreshToDoButton> createState() => _RefreshToDoButtonState();
}

final ToDoRepository toDoRepository = ToDoRepository();

class _RefreshToDoButtonState extends State<RefreshToDoButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {});
      },
      child: Column(
        children: [
          const Text("Refresh",
              style: TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                  fontWeight: FontWeight.bold)),
          Container(
            height: 2,
            width: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 15, 150, 180),
            ),
          ),
        ],
      ),
    );
  }
}
