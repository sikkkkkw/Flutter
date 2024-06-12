import 'package:app/bloc/todo_bloc.dart';
import 'package:app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = TodoBloc();

    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: UniqueKey(),
      onDismissed: (direction) {
        bloc.removeTodo(todo);
      },
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.content ?? ''),
        onTap: () {},
        trailing: Icon(
          Icons.check_circle_rounded,
          color: setColor(todo.status),
        ),
      ),
    );
  }

  Color setColor(String status) {
    switch (status) {
      case 'work':
        return TodoStatus.work.color;
      case 'personal':
        return TodoStatus.personal.color;
      case 'other':
        return TodoStatus.other.color;
      default:
        return Colors.black;
    }
  }
}
