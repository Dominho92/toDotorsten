import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_torsten/home/models/todo.dart';

class ToDoRepository {
  Future<List<ToDo>> removeToDo(ToDo toDoToRemove) async {
    final toDos = await getSavedToDo();
    for (ToDo toDo in toDos) {
      if (toDoToRemove.creationDate == toDo.creationDate) {
        toDos.remove(toDo);
        break;
      }
    }
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

  Future<List<ToDo>> get doneTodos async {
    final toDos = await getSavedToDo();
    return toDos.where((e) => e.isDone).toList();
  }

  Future<List<ToDo>> get openTodos async {
    final toDos = await getSavedToDo();
    return toDos.where((e) => !e.isDone).toList();
  }

  Future<void> updateToDo(ToDo toDo) async {
    final toDos = await getSavedToDo();
    for (int i = 0; i < toDos.length; i++) {
      if (toDos[i].creationDate == toDo.creationDate) {
        toDos[i] = toDo;
        break;
      }
    }
    final prefs = await SharedPreferences.getInstance();
    final jsonList = toDos.map((e) => e.toJson()).toList();
    await prefs.setString('toDo', jsonEncode(jsonList));
  }
}
