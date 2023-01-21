import 'package:consumindo_api_jsonplaceholder/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final TodoRepository repository;

  setUp(() {
    repository = TodoRepository();
  });

  test('todo repository ...', () async {
    final list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}
