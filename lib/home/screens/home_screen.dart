import 'package:flutter/material.dart';
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
  late Future<List<ToDo>> toDosMock;

  ToDoRepository toDoRepository = ToDoRepository();

  @override
  void initState() {
    toDosMock = toDoRepository.getTodo();
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
                        return Container(
                          color: const Color.fromARGB(107, 76, 76, 76),
                          child: ListTile(
                            title: Text(
                              snapshot.data![index].title,
                              style: const TextStyle(color: Colors.white),
                            ),
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
