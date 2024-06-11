import 'dart:ui';
import 'package:flutter/material.dart';

enum TodoStatus {
  work,
  personal,
  other;

  Color get color {
    switch (this) {
      case TodoStatus.work:
        return Colors.red;
      case TodoStatus.personal:
        return Colors.blue;
      case TodoStatus.other:
        return Colors.green;
    }
  }
}

class Todo {
  final int id;
  final String title;
  final String date;
  final String status;
  final String? content;
  final DateTime? createAt;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.status,
      this.content,
      this.createAt});
}
