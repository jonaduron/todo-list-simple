import 'package:flutter/material.dart';

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal[500],
      isExtended: true,
      onPressed: null,
      child: Icon(
        Icons.add,
        color: Colors.white
      ),
    );
  }
}