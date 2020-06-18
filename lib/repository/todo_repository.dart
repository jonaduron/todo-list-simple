import 'dart:async';
import 'dart:core';

import 'package:todo_list/data/todo.dart';

abstract class Repository {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int todoId);
  Future<bool> addTodo(Todo newTodo);
  Future<bool> editTodo(Todo todoToupdate);
  Future<bool> deleteTodo(int todoId);
}

class TodoRepository implements Repository {
  List<Todo> todos = [];

  Future<List<Todo>> getTodos() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        
        todos = [
          Todo(1, 'title1', 'description1', false),
          Todo(2, 'title2', 'description2', false),
          Todo(3, 'title3', 'description3', false),
        ];

        return todos;
      }
    );
  }

  Future<Todo> getTodo(int todoId) {
    Todo todo;
    return Future.delayed(
      Duration(seconds: 2),
      () {
        for(var i = 0; i <= todos.length; i++) {
          if(todoId == todos[i].id) {
            todo = todos[i];
          } else {
            todo = null;
          }
        }
        return todo;
      }
    );
  }

  Future<bool> addTodo(Todo newTodo) {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        try {
          todos.add(newTodo);
          return true;
        } on Error {
          return false;
        }
      }
    );
  }

  Future<bool> editTodo(Todo todoToUpdate) {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        for(var i = 0; i <= todos.length; i++) {
          if(todos[i].id == todoToUpdate.id) {
            todos[i] = todoToUpdate;
          } else {
            return false;
          }
        }        
      }
    );
  }

  Future<bool> deleteTodo(int todoId) {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        for(var i = 0; i <= todos.length; i++) {
          if(todos[i].id == todoId) {
            todos.removeAt(todoId);
          } else {
            return false;
          }
        }    
      }
    );
  }
}

class NetworkError extends Error {}