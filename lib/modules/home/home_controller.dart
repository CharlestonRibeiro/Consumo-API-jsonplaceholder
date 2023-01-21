import 'package:consumindo_api_jsonplaceholder/models/todo_model.dart';
import 'package:consumindo_api_jsonplaceholder/modules/home/home_state.dart';
import 'package:consumindo_api_jsonplaceholder/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  HomeState _homeState = HomeInitialState();
  HomeState get state => _homeState;

  void _updateState(HomeState newState) {
    _homeState = newState;
    notifyListeners();
  }

  Future start() async {
    _updateState(HomeLoadingState());
    try {
      todos = await repository.fetchTodos();
      _updateState(HomeSuccessState());
    } catch (e) {
      String erro = 'Erro API não encontrada';
      _updateState(HomeErrorState(erro));
    }
  }
}
