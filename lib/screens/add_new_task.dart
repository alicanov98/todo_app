import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  // Passing function as parameter

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Tasktype taskType = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    // Device Height and Width
    double deviceHeight = MediaQuery.of(context).size.height / 10;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/header_two.png'),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      )),
                  const Expanded(
                      child: Text(
                    'Add new task',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text('Task Titile')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Category'),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('Category Selected one'),
                        ),
                      );
                      setState(() {
                        taskType = Tasktype.note;
                      });
                    },
                    child: Image.asset('lib/assets/images/category_one.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('Category Selected two'),
                        ),
                      );
                      setState(() {
                        taskType = Tasktype.calendar;
                      });
                    },
                    child: Image.asset('lib/assets/images/category_two.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('Category Selected three'),
                        ),
                      );
                      setState(() {
                        taskType = Tasktype.contest;
                      });
                    },
                    child: Image.asset('lib/assets/images/category_three.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Date'),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: dateController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Time'),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text('Description')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 170,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Task newTask = Task(
                    type: taskType,
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: false,
                  );
                  widget.addNewTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    ));
  }
}
