import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/todo.dart';
import 'package:todo_list/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRep;

  TodoBloc(this.todoRep);

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    yield TodoLoading();
    if(event is GetTodos) {
      try {
        final todos = await todoRep.getTodos();
        yield TodosLoaded(todos);
      } on Error {
        yield TodoError('Cannot show the already existing todos. Try again.');
      }
    } else if (event is GetTodo) {
      try {
        final todo = await todoRep.getTodo(event.todoId);
        yield TodoLoaded(todo);
      } on Error {
        yield TodoError('Cannot show the todo. Try again.');
      }
    } else if (event is AddTodo) {
      try {
        final newTodo = await todoRep.addTodo(event.todo);
        final todos = await todoRep.getTodos();
        yield TodosLoaded(todos);
      } on Error {
        yield TodoError('Cannot show the todo. Try again.');
      }
    }
  }
}