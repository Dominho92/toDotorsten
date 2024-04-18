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
}

List<ToDo> toDosMock = [];
