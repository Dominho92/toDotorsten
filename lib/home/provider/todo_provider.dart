import 'package:flutter/material.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';

class ToDoProvider extends ChangeNotifier {
  final ToDoRepository toDoRepository = ToDoRepository();
  late Future<List<ToDo>> toDosMock;

  void addToDo(ToDo toDo) {
    toDoRepository.addToDo(toDo);
    notifyListeners();
  }

  void removeToDo(ToDo toDo) {
    toDoRepository.removeToDo(toDo);
    notifyListeners();
  }
}
