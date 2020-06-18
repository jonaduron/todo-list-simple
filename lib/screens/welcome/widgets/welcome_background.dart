import 'package:flutter/material.dart';

class WelcomeBackground extends StatefulWidget {
  @override 
  _WelcomeBackgroundState createState() => _WelcomeBackgroundState();
}

class _WelcomeBackgroundState extends State<WelcomeBackground> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple[600],
    );
  }
}