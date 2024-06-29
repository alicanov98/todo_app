import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
      type: Tasktype.calendar,
      title: 'Study Lessons',
      description: 'Study COMP117',
      isCompleted: false,
    ),
    Task(
      type: Tasktype.note,
      title: 'Go To Party',
      description: 'Attend to party',
      isCompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: 'Run 5K',
      description: 'Run 5km',
      isCompleted: false,
    ),
  ];

  List<Task> completed = [
    Task(
      type: Tasktype.calendar,
      title: 'Go To Party',
      description: 'Attend to party',
      isCompleted: true,
    ),
    Task(
      type: Tasktype.contest,
      title: 'Run 5K',
      description: 'Run 5km',
      isCompleted: true,
    ),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodos();
    // Device Height and Width
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    double deviceWidth = MediaQuery.of(context).size.width;

    void addNewTask(Task newTask) {
      setState(() {
        todo.add(newTask);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // Header
              headerContainer(deviceWidth, deviceHeight),
              // Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          return Todoitem(
                            task: todo[index],
                          );
                        }),
                  ),
                ),
              ),
              //  Completed Text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Complated',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Bottom Column
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: completed.length,
                            itemBuilder: (context, index) {
                              return Todoitem(
                                task: completed[index],
                              );
                            }),
                      ))),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                        addNewTask: (newTask) => addNewTask(newTask),
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF4A3780),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Add New Task'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container headerContainer(double deviceWidth, double deviceHeight) {
    return Container(
      width: deviceWidth,
      height: deviceHeight,
      decoration: const BoxDecoration(
          color: Colors.purple,
          image: DecorationImage(
              image: AssetImage('lib/assets/images/header.png'),
              fit: BoxFit.cover)),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Iyun 14,2024',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'My Todo List',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
