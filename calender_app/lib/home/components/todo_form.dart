import 'package:app/bloc/todo_bloc.dart';
import 'package:app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoFome extends StatefulWidget {
  const TodoFome({
    super.key,
  });

  @override
  State<TodoFome> createState() => _TodoFomeState();
}

class _TodoFomeState extends State<TodoFome> {
  DateTime _setDate = DateTime.now();
  final ValueNotifier<TodoStatus> selectedType = ValueNotifier(TodoStatus.work);
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _bloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2024, 1, 1),
                      lastDate: DateTime(2024, 12, 31));
                  print(date);
                  setState(() {
                    _setDate = date ?? _setDate;
                  });
                },
                child: Text(DateFormat('yyyy-MM-dd').format(_setDate)),
              ),
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "할일을 입력해주세요"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "할일을 제대로 입력해주세요.";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "내용을 입력하세요"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: TodoStatus.values
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TodoStatusButton(
                          status: e,
                          selectedType: selectedType,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final title = _titleController.text;
                    final content = _contentController.text;
                    final date = DateFormat("yyyy-MM-dd").format(_setDate);
                    _bloc.addTodo(
                        title: title, date: date, status: selectedType.value);
                    Navigator.pop(context);
                  }
                },
                child: Text("저장"))
          ],
        ),
      ),
    );
  }
}

class TodoStatusButton extends StatelessWidget {
  final TodoStatus status;
  final ValueNotifier<TodoStatus> selectedType;

  const TodoStatusButton({
    super.key,
    required this.status,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TodoStatus>(
      valueListenable: selectedType,
      builder: (context, value, _) {
        bool isSelected = value == status;
        return GestureDetector(
          onTap: () {
            selectedType.value = status;
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status.color,
              border:
                  isSelected ? Border.all(color: Colors.black, width: 2) : null,
            ),
            child: Center(
              child: Text(
                status.name.split('')[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
