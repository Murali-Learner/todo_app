import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  Map<String, TodoModel> todos = {};

  void addTodo(String title, String description) {
    final id = DateTime.now().toString();
    todos[id] = TodoModel(
      id: id,
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    notifyListeners();
  }

  void updateTodo(String todoId, String description,
      {String? title, bool? isCompleted}) {
    if (todos.containsKey(todoId)) {
      final currentTodo = todos[todoId]!;
      todos[todoId] = currentTodo.copyWith(
          title: title ?? currentTodo.title,
          isCompleted: isCompleted ?? currentTodo.isCompleted,
          description: description);
      notifyListeners();
    }
  }

  void toggleTodoStatus(String todoId) {
    if (todos.containsKey(todoId)) {
      final currentTodo = todos[todoId]!;
      todos[todoId] =
          currentTodo.copyWith(isCompleted: !currentTodo.isCompleted);
      notifyListeners();
    }
  }

  void deleteTodo(String todoId) {
    todos.remove(todoId);
    notifyListeners();
  }
}
