import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  final int title;

  Screen1({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("screen odd"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('value from host is odd : $title')],
        ),
      ),
    );
  }
}
