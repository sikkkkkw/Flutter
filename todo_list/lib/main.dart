import 'package:flutter/material.dart';
import 'package:todo_list/submitButton.dart';
import 'package:todo_list/todo_list_widget.dart';
import 'package:todo_list/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //<List<TodoModel>> 제네릭(generic)
    final ValueNotifier<List<TodoModel>> TodoNotifier =
        ValueNotifier<List<TodoModel>>([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("오늘 할일"),
          ),
          body: Column(
            children: [
              Expanded(
                child: TodoListWidget(TodoNotifier: TodoNotifier),
              ),
              InputField(TodoNotifier: TodoNotifier)
            ],
          )),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.TodoNotifier,
  });

  final ValueNotifier<List<TodoModel>> TodoNotifier;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SubmitButton(
          TodoNotifier: widget.TodoNotifier,
          controller: _controller,
        ),
      ],
    );
  }
}
