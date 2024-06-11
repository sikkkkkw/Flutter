//비동기 함수 1.Future: 한번만 실행후 종료 2.Stream: 내가 종료하기 전까지는 계속 실행

import 'dart:async';

import 'package:app/common/dummy_data.dart';
import 'package:app/model/todo_model.dart';

class TodoBloc {
  // 싱글턴 패턴(singleton pattern)
  // 하나의 인스턴스만 생성

  // 클래스 변수
  static final TodoBloc _instance = TodoBloc._internal();
  // 생성자
  // 인스턴스를 만들때 자동으로 실행하는 함수(메서드)
  TodoBloc._internal();
  // factory 생성자
  factory TodoBloc() {
    return _instance;
  }
  final _todoListController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListController.stream;

  void getTimeWithDate(String date) {
    // 마지막에 toList를 해줘야지 list를 뽑아낼 수 있다.
    final todos = DUMMY_DATA.where((e) => e.date == date).toList();
    _todoListController.sink.add(todos);
  }
}
