import 'package:flutter/material.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({super.key});

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      width: 368,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/todocardbg.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 180.0, top: 10),
            child: Text("ToDo Title",
                style: TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(
                      255,
                      127,
                      132,
                      137,
                    ),
                    fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 180.0),
            child: Text("Status:",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(
                    255,
                    127,
                    132,
                    137,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Center(
              child: Text(
                "- Wäsche Waschen ",
                style: TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(
                      255,
                      127,
                      132,
                      137,
                    ),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: Center(
              child: Text(
                "DELETE ",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(
                      255,
                      127,
                      132,
                      137,
                    ),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 2,
            width: 80,
            color: const Color.fromARGB(255, 183, 28, 72),
          ),
        ],
      ),
    );
  }
}
