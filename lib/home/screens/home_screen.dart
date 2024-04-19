import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/provider/todo_provider.dart';
import 'package:todo_torsten/home/style/styles.dart';
import 'package:todo_torsten/home/widgets/addtodo_button.dart';
import 'package:todo_torsten/home/widgets/deletetodo_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: customBG,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 30),
              FutureBuilder(
                future: context.watch<ToDoProvider>().toDoRepository.openTodos,
                builder: (context, AsyncSnapshot<List<ToDo>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String formattedData = DateFormat('dd.MM.yyyy - kk:mm')
                            .format(snapshot.data![index].creationDate);
                        return Container(
                          color: const Color.fromARGB(147, 76, 76, 76),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                snapshot.data![index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            subtitle: Column(children: [
                              const Divider(
                                color: Colors.white,
                                height: 10,
                                thickness: 1,
                                indent: 0,
                                endIndent: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 72.0),
                                child: Text(
                                  "Erstellt am: $formattedData",
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 173, 173, 173)),
                                ),
                              )
                            ]),
                            leading: Checkbox(
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              checkColor: Colors.black,
                              value: snapshot.data![index].isDone,
                              onChanged: (bool? value) {
                                final provider = Provider.of<ToDoProvider>(
                                    context,
                                    listen: false);
                                provider.updateToDo(
                                  ToDo(
                                    title: snapshot.data![index].title,
                                    creationDate:
                                        snapshot.data![index].creationDate,
                                    isDone: value!,
                                  ),
                                );
                              },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.white,
                              onPressed: () {
                                final provider = Provider.of<ToDoProvider>(
                                    context,
                                    listen: false);
                                provider.removeToDo(snapshot.data![index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("ToDo wurde gelöscht!"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddToDoButton(),
                  SizedBox(width: 20),
                  DeleteAllToDoButton(),
                ],
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text("Done ToDo's:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const Divider(
                color: Color.fromARGB(255, 173, 173, 173),
                height: 10,
                thickness: 1,
                indent: 20,
                endIndent: 40,
              ),
              const SizedBox(height: 5),
              FutureBuilder(
                future: context.watch<ToDoProvider>().toDoRepository.doneTodos,
                builder: (context, AsyncSnapshot<List<ToDo>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String formattedData = DateFormat('dd.MM.yyyy - kk:mm')
                            .format(snapshot.data![index].creationDate);
                        return Container(
                          color: const Color.fromARGB(147, 76, 76, 76),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                snapshot.data![index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            subtitle: Column(children: [
                              const Divider(
                                color: Colors.white,
                                height: 10,
                                thickness: 1,
                                indent: 0,
                                endIndent: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 72.0),
                                child: Text(
                                  "Erstellt am: $formattedData",
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 173, 173, 173)),
                                ),
                              )
                            ]),
                            leading: Checkbox(
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              checkColor: Colors.black,
                              value: snapshot.data![index].isDone,
                              onChanged: (bool? value) {
                                final provider = Provider.of<ToDoProvider>(
                                    context,
                                    listen: false);
                                provider.updateToDo(
                                  ToDo(
                                    title: snapshot.data![index].title,
                                    creationDate:
                                        snapshot.data![index].creationDate,
                                    isDone: value!,
                                  ),
                                );
                              },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.white,
                              onPressed: () {
                                final provider = Provider.of<ToDoProvider>(
                                    context,
                                    listen: false);
                                provider.removeToDo(snapshot.data![index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("ToDo wurde gelöscht!"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
