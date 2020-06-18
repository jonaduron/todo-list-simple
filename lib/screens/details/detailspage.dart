import 'package:flutter/material.dart';
import 'package:todo_list/screens/details/widgets/custom_text_field.dart';

class DetailsPage extends StatefulWidget {
  @override 
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
        ) ,
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: titleController,
              tag: 'Title',
              icon: Icons.title
            ),
            CustomTextField(
              controller: descriptionController,
              tag: 'Description',
              icon: Icons.description
            ),
            RaisedButton(
              color: Colors.teal[500],
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                'See actions'
              ),
            ),
          ],
        )
      ),
    );
  }
}