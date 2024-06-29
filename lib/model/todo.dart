
class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userID,
  });
  int? id;
  String? todo;
  bool? completed;
  int? userID;

  // FROM JSON
  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userID = json['userID'];
  }
  // TO JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userID'] = userID;
    return data;
  }
}
