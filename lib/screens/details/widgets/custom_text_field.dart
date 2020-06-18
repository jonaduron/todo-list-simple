import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller; 
  final String tag; 
  final icon;

  CustomTextField({Key key, @required this.controller, @required this.tag, @required this.icon}) : super(key: key);


  @override 
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override 
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon)
          ), 
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(widget.tag),
        SizedBox(
          height: 30.0,
        )
      ],
    );
  }
}