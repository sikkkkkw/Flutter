import 'package:app/bloc/todo_bloc.dart';
import 'package:app/home/components/calender.dart';
import 'package:app/home/components/todo_form.dart';
import 'package:app/home/components/todo_listwidget.dart';
import 'package:app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomCalender(),
          Expanded(
            child: TodoListWidget(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => TodoFome());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final bloc = TodoBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        builder: (context, snapshot) {
          // 에러 났을 경우
          if (snapshot.hasError) {
            return Center(
              child: Text("에러가 발생했습니다."),
            );
          }
          // 데이터가 존재하지 않을경우
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // List<Todo>
          final data = snapshot.data!;

          if (data.isEmpty) {
            return Center(
              child: Text("데이터가 비워있습니다."),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoWidget(
                todo: data[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        });
  }
}
