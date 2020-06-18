import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/data/todo.dart';
import 'package:todo_list/screens/details/detailspage.dart';

class TodosList extends StatefulWidget {
  @override 
  _TodosListState createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {

  int selectedTodo;

  List<Todo> todos = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    setState(() {
      getAllTodos(context);
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: BlocListener<TodoBloc, TodoState> (
        listener: (BuildContext context, TodoState todoState) {
          if(todoState is TodoError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(todoState.message),
              )
            );
          }
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, todoState) {
            if(todoState is TodoLoading) {
              return _loading();
            } else if (todoState is TodosLoaded) {
              return _list(context, todoState.todos);
            }
          }
        ),
      ),
    );
  }

  Widget _list(BuildContext context, List<Todo> todos) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text(
              todos[index].title,
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
            trailing: Checkbox(
              value: todos[index].isChecked, 
              onChanged: (bool newValue) {
                setState(() {
                  todos[index].isChecked = newValue;
                });
              }
            ),
            onLongPress: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage()));
            },
          ),
        );
      },
    );
  }

  Widget _loading() {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  void getAllTodos(BuildContext context) {
    final toodBloc = BlocProvider.of<TodoBloc>(context);
    toodBloc.add(GetTodos());
  }
}