import 'package:flutter/material.dart';
import 'package:todo_list/screens/welcome/widgets/welcome_background.dart';
import 'package:todo_list/screens/welcome/widgets/welcome_info.dart';

class WelcomePage extends StatefulWidget {
  @override 
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override 
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WelcomeBackground(),
        WelcomeInfo()
      ],
    );
  }
}