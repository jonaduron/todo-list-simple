import 'package:flutter/material.dart';
import 'package:todo_list/data/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool visibilityNew = true;
  bool visibilityAlreadyExists = false;
  int selectedTodo;

  List<Todo> todos = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _addTodo(title, description) {
    setState(() {
      todos.add(Todo(title, description, false));
    });
  }

  void _deleteTodo() {
    setState(() {
      todos.removeAt(selectedTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list simple'),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
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
                        selectedTodo = index;
                        Scaffold.of(context).showBottomSheet(
                          (context) => Container(
                            color: Colors.purple,
                            height: 120.0,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Edit item',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Delete item',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                  onTap: () {
                                    _deleteTodo();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      prefixIcon: Icon(Icons.title)
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      prefixIcon: Icon(Icons.description)
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Add todo',
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),
                    color: Colors.purple,
                    onPressed: () {
                      _addTodo(titleController.text, descriptionController.text);
                      setState(() {
                        titleController.clear();
                        descriptionController.clear();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
