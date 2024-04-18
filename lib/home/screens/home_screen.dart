import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_torsten/home/models/todo.dart';
import 'package:todo_torsten/home/provider/todo_provider.dart';
import 'package:todo_torsten/home/repositorys/todo_repository.dart';
import 'package:todo_torsten/home/style/styles.dart';
import 'package:todo_torsten/home/widgets/addtodo_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ToDo>>? toDosMock;

  ToDoRepository toDoRepository = ToDoRepository();

  ToDo? toDo;

  void _loadSavedToDo() async {
    final toDoFromRepo = await ToDoRepository().getSavedToDo();
    if (toDoFromRepo != null) {
      setState(() {
        toDo = toDoFromRepo;
      });
    }
  }

  @override
  void initState() {
    toDosMock = toDoRepository.getTodo();
    _loadSavedToDo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: customBG,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              if (toDosMock != null)
                FutureBuilder(
                  future: toDosMock,
                  builder: (context, AsyncSnapshot<List<ToDo>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String formattedData =
                              DateFormat('dd.MM.yyyy - kk:mm')
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
                              trailing: Checkbox(
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                checkColor: Colors.black,
                                value: snapshot.data![index].isDone,
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data![index].isDone = value!;
                                    provider.removeToDo(snapshot.data![index]);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const AddToDoButton(),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        toDosMock = toDoRepository.getTodo();
                      });
                    },
                    child: Column(
                      children: [
                        const Text("Refresh",
                            style: TextStyle(
                                color: Color.fromARGB(255, 173, 173, 173),
                                fontWeight: FontWeight.bold)),
                        Container(
                          height: 2,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 15, 150, 180),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
