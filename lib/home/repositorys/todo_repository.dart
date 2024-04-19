import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_torsten/home/models/todo.dart';

class ToDoRepository {
  Future<List<ToDo>> removeToDo(ToDo toDo) async {
    final toDos = await getSavedToDo();
    toDos.remove(toDo);
    final prefs = await SharedPreferences.getInstance();
    final jsonList = toDos.map((e) => e.toJson()).toList();
    await prefs.setString('toDo', jsonEncode(jsonList));
    return toDos;
  }

  Future<List<ToDo>> getSavedToDo() async {
    final prefs = await SharedPreferences.getInstance();
    final toDoString = prefs.getString('toDo');
    if (toDoString == null) return [];
    final jsonList = jsonDecode(toDoString) as List;
    final toDos = jsonList.map((e) => ToDo.fromJson(e)).toList();
    return toDos;
  }

  Future<List<ToDo>> addToDo(ToDo toDo) async {
    final toDos = await getSavedToDo();
    toDos.add(toDo);
    final prefs = await SharedPreferences.getInstance();
    final jsonList = toDos.map((e) => e.toJson()).toList();
    await prefs.setString('toDo', jsonEncode(jsonList));
    return toDos;
  }

  Future<void> deleteToDo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('toDo');
  }
}
