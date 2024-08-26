import 'package:flutter/material.dart';

import '../utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const _appColor = Colors.deepPurple;
  static final _toDoList = <Map<String, dynamic>>[
    {'taskName': 'Learn Flutter', 'checkBox': false},
    {'taskName': 'Drink Coffee', 'checkBox': false},
    {'taskName': 'Code With Mworia', 'checkBox': false},
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkBoxChanged(int i) {
    setState(() {
      HomePage._toDoList[i]['checkBox'] = !HomePage._toDoList[i]['checkBox']; 
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
            onChanged: (val) => checkBoxChanged(index)),
        itemCount: HomePage._toDoList.length,
      ),
    );
  }
}
