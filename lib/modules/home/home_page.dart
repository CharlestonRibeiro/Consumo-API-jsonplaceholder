import 'package:consumindo_api_jsonplaceholder/modules/home/home_controller.dart';
import 'package:consumindo_api_jsonplaceholder/modules/home/home_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController(null);

  _success() {
    return ListView.builder(
        itemCount: homeController.todos.length,
        itemBuilder: (BuildContext context, int index) {
          var todo = homeController.todos[index];
          return ListTile(
            title: Text(todo.title!),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          homeController.start();
        },
        child: const Text('Testar novamente'),
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    homeController.start();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Todo's"),
        actions: [
          IconButton(
              onPressed: () {
                homeController.start();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
        animation: homeController.state,
        builder: (context, child) {
          return stateManagement(homeController.state.value);
        },
      ),
    );
  }
}
