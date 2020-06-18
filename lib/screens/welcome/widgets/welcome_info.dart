import 'package:flutter/material.dart';
import 'package:todo_list/screens/homepage/homepage.dart';

class WelcomeInfo extends StatefulWidget {
  @override 
  _WelcomeInfoState createState() => _WelcomeInfoState();
}

class _WelcomeInfoState extends State<WelcomeInfo> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /*Center(
            child: Container(
                child: FlareActor(
                  "assets/little_yellow_man.flr2d", 
                  fit: BoxFit.contain, 
                  animation: "roll",
                ),
                height: 300,
                width: 300,
            ),
          ),*/
          Text(
            'Welcome to this AWESOME TODO APP',
            style: TextStyle(
              fontFamily: 'Arial',
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),  
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),
          RaisedButton(
            color: Colors.teal[500],
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute (builder: (context) => HomePage())
              );
            },
            child: Text(
              'Go',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}