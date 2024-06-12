// 추상 클래스
import 'package:app/db/database.dart';
import 'package:app/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos({required String date});
  Future<void> addNewTodo(TodoItemsCompanion todoItem);
  Future<void> deleteTodoById(int id);
}

class TodoRepositoryImpl implements TodoRepository {
  final AppDatabase _database;
  TodoRepositoryImpl(this._database);
  @override
  Future<void> addNewTodo(TodoItemsCompanion todoItem) {
    // TODO: implement addNewTodo
    return _database.insertTodoItems(item: todoItem);
  }

  @override
  Future<void> deleteTodoById(int id) {
    // TODO: implement deleteTodoById
    return _database.deleteTodoItems(id);
  }

  @override
  Future<List<Todo>> getTodos({required String date}) async {
    // TODO: implement getTodos
    return await _database.getItems(date);
  }
}
