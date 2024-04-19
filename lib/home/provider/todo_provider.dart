import 'package:flutter/material.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';

class ToDoProvider extends ChangeNotifier {
  final ToDoRepository toDoRepository = ToDoRepository();

  void addToDo(ToDo toDo) {
    toDoRepository.addToDo(toDo);
    notifyListeners();
  }

  void removeToDo(ToDo toDo) {
    toDoRepository.removeToDo(toDo);
    notifyListeners();
  }

  void updateToDo(ToDo toDo) {
    toDoRepository.updateToDo(toDo);
    notifyListeners();
  }

  void deleteToDo() {
    toDoRepository.deleteToDo();
    notifyListeners();
  }
}
