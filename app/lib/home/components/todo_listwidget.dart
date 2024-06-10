import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("안녕하세요."),
      subtitle: Text("핳"),
      onTap: () {},
      trailing: Icon(
        Icons.check_circle_rounded,
        color: Colors.red,
      ),
    );
  }
}
