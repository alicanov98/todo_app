import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task, required this.onToggle});
  final Todo task;
  final Function(Todo) onToggle;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.isCompleted ?? true;
  }

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
            widget.task.type == Tasktype.note
                ? Image.asset('lib/assets/images/category_one.png')
                : widget.task.type == Tasktype.contest
                    ? Image.asset('lib/assets/images/category_three.png')
                    : Image.asset('lib/assets/images/category_two.png'),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.task.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val!;
                  widget.task.isCompleted = isChecked;
                });
                widget.onToggle(widget.task);
              },
            )
          ],
        ),
      ),
    );
  }
}
