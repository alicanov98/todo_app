import 'dart:ffi';

import 'package:todo_app/constants/tasktype.dart';

class Todo {
  Todo({
    required this.type,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  Tasktype? type;
  String? title;
  String? description;
  bool? isCompleted;

  // From json
  // Todo.fromJson(Map<String, dynamic> json) {
  //   id = json["id"];
  //   todo = json["todo"];
  //   completed = json["completed"];
  //   userId = json["userId"];
  // }

  // To json
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data["id"] = id;
  //   data["todo"] = todo;
  //   data["completed"] = completed;
  //   data["userId"] = userId;

  // }
}
