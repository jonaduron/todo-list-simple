import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override 
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController controller = TextEditingController();

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
            TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title)
              ), 
            ),
            SizedBox(
              height: 5.0,
            ),
            Text('Title'),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description)
              ), 
            ),
            SizedBox(
              height: 5.0,
            ),
            Text('Description'),
            Container(
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'btn1',
                    onPressed: null,
                    child: Icon(Icons.update)
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: null,
                    child: Icon(Icons.delete)
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}