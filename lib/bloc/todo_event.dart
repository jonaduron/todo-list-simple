part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTodos extends TodoEvent {
  GetTodos();

  @override
  List<Object> get props => [];
}

class GetTodo extends TodoEvent {
  final int todoId;

  GetTodo(this.todoId);

  @override
  List<Object> get props => [todoId];
}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class EditTodo extends TodoEvent {
  final Todo todo;

  EditTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final int todoId; 

  DeleteTodo(this.todoId);

  @override
  List<Object> get props => [todoId];
}