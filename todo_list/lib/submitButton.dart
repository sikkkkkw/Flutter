import 'package:flutter/material.dart';
import 'package:todo_list/todo_model.dart';

class SubmitButton extends StatelessWidget {
  final ValueNotifier<List<TodoModel>> TodoNotifier;
  final TextEditingController controller;
  const SubmitButton({
    super.key,
    required this.TodoNotifier,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration:
          BoxDecoration(color: Colors.purple.shade400, shape: BoxShape.circle),
      child: InkWell(
        onTap: () {
          print("dddd");
          if (controller.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("공백은 안됩니다.")));
            return;
          }
          // todoNotifier에 값을 추가
          TodoNotifier.value = [
            ...TodoNotifier.value,
            TodoModel(title: controller.text)
          ];
          controller.clear();
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
