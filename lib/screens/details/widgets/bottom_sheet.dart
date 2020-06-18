import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  BottomSheet({Key key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      child: RaisedButton(
        onPressed: () {
          //selectedTodo = index;
          //titleController.text = todos[index].title;
          //descriptionController.text = todos[index].description;
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
                    onTap: () {
                      /*_editTodo();
                      titleController.clear();
                      descriptionController.clear();*/
                    },
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
                      //_deleteTodo();
                    },
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}