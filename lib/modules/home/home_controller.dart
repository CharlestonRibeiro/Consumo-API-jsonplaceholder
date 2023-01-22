import 'package:consumindo_api_jsonplaceholder/models/todo_model.dart';
import 'package:consumindo_api_jsonplaceholder/modules/home/home_state.dart';
import 'package:consumindo_api_jsonplaceholder/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<TodoModel> todos = [];

  final TodoRepository _todoRepository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController(TodoRepository? todoRepository)
      : _todoRepository = todoRepository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _todoRepository.fetchTodos();
      state.value = HomeState.success;
      return todos;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
