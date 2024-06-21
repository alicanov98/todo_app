import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/todoItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ['Study Lessons', 'Run 5K', 'Go To Party'];
List<String> complated = ['Game meetup', 'Take out tash'];

class _MyAppState extends State<MyApp> {
  // CheckBox checked
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // Device Height and Width
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    double deviceWidth = MediaQuery.of(context).size.width;

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
                            title: todo[index],
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
                            itemCount: complated.length,
                            itemBuilder: (context, index) {
                              return Todoitem(
                                title: complated[index],
                              );
                            }),
                      ))),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Add New Task'))
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
