import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/repository/todo_repository.dart';
import 'package:todo_list/screens/homepage/widgets/float_button.dart';
import 'package:todo_list/screens/homepage/widgets/todos_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (BuildContext context) => TodoBloc(TodoRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo list simple'),
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TodosList(),
            ],
          ),
        ),
        floatingActionButton: FloatButton(),
      )
    );
  }
}
