import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isChecked ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            widget.task.type == Tasktype.note
                ? Image.asset('lib/assets/images/category_one.png')
                : widget.task.type == Tasktype.contest
                    ? Image.asset('lib/assets/images/category_three.png')
                    : Image.asset('lib/assets/images/category_two.png'),
                    */
            Image.asset('lib/assets/images/category_one.png'),
            Expanded(
              child: Column(
                children: [
                  Align(
                    child: Text(
                      widget.task.todo!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),
                  // Text(widget.task.todo!,
                  //     style: TextStyle(
                  //         fontSize: 9,
                  //         fontWeight: FontWeight.bold,
                  //         decoration: widget.task.completed!
                  //             ? TextDecoration.lineThrough
                  //             : TextDecoration.none)),
                  Text('User${widget.task.userId}')
                ],
              ),
            ),
            Checkbox(
                value: isChecked,
                onChanged: (val) => {
                      setState(() {
                        widget.task.completed = !widget.task.completed!;
                        isChecked = val!;
                      })
                    })
          ],
        ),
      ),
    );
  }
}
