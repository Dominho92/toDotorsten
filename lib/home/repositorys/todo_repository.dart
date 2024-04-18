import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_torsten/home/models/todo.dart';

class ToDoRepository {
  Future<List<ToDo>> getTodo() async {
    return await Future.value(toDosMock);
  }

  void addToDo(ToDo toDo) {
    toDosMock.add(toDo);
  }

  removeToDo(ToDo toDo) {
    toDosMock.remove(toDo);
  }

  Future<ToDo?> getSavedToDo() async {
    final prefs = await SharedPreferences.getInstance();
    final todoString = prefs.getString('toDo');
    if (todoString == null) {
      return null;
    }
    final todoMap = jsonDecode(todoString);
    final todo = ToDo.fromJson(todoMap);
    return todo;
  }

  Future<bool> saveTodo(ToDo todo) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString('toDo', jsonEncode(todo.toJson()));
  }
}

List<ToDo> toDosMock = [];
