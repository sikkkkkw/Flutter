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
  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "할일을 입력해주세요"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
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
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("저장"))
        ],
      ),
    );
  }
}

class TodoStatusButton extends StatelessWidget {
  final TodoStatus status;
  const TodoStatusButton({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(shape: BoxShape.circle, color: status.color),
      child: Center(
        child: Text(
          status.name.split('')[0].toUpperCase(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
