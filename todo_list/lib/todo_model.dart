class TodoModel {
  String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});

  void copywith(bool? isDone) {
    this.isDone = isDone ?? this.isDone;
  }
}
