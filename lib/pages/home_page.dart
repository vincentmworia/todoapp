import 'package:flutter/material.dart';

import '../utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const _appColor = Colors.deepPurple;
  static final _toDoList = <Map<String, dynamic>>[
    // {'taskName': 'Learn Flutter', 'checkBox': false},
    // {'taskName': 'Drink Coffee', 'checkBox': false},
    // {'taskName': 'Code today', 'checkBox': false},
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _fNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _fNode.dispose();
  }

  void checkBoxChanged(int i) {
    setState(() {
      HomePage._toDoList[i]['checkBox'] = !HomePage._toDoList[i]['checkBox'];
    });
  }

  void saveNewTask() {
    setState(() {
      HomePage._toDoList.add(
        {'taskName': _controller.text, 'checkBox': false},
      );
      _controller.clear();
    });
  }

  void deleteTask(int i){
    setState(() {
      HomePage._toDoList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePage._appColor.shade300,
      appBar: AppBar(
        title: const Text(
          'Simple ToDo',
          style: TextStyle(fontSize: 25.0, letterSpacing: 3.0),
        ),
        centerTitle: true,
        backgroundColor: HomePage._appColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => TodoList(
          appColor: HomePage._appColor,
          taskName: HomePage._toDoList[index]['taskName'],
          taskCompleted: HomePage._toDoList[index]['checkBox'],
          onChanged: (val) => checkBoxChanged(index),
          deleteFunction: (ctx) => deleteTask(index),
        ),
        itemCount: HomePage._toDoList.length,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                focusNode: _fNode,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Add a new todo item',
                  filled: true,
                  fillColor: HomePage._appColor.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: HomePage._appColor,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: HomePage._appColor,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
