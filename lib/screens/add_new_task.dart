import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 41),
              child: TextField(
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white),
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
                    },
                    child: Image.asset('lib/assets/images/category_three.png'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Date'),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Time'),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text('Notes')),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 170,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Save'))
          ],
        ),
      ),
    ));
  }
}
