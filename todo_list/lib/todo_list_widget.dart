import 'package:flutter/material.dart';
import 'package:todo_list/todo_model.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    super.key,
    required this.TodoNotifier,
  });

  final ValueNotifier<List<TodoModel>> TodoNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: TodoNotifier,
        builder: (context, list, child) {
          if (list.isEmpty) {
            return const Center(child: Text("할일을 추가해주세요"));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return TodoWidget(
                todo: list[index],
              );
            },
          );
        });
  }
}

class TodoWidget extends StatefulWidget {
  final TodoModel todo;
  const TodoWidget({
    super.key,
    required this.todo,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            widget.todo.copywith(!widget.todo.isDone);
            setState(() {});
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(widget.todo.title),
          trailing: widget.todo.isDone
              ? const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.red,
                )
              : const Icon(Icons.circle)),
    );
  }
}
