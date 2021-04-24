import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final int title;

  Screen2({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("screen even"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('value from host is even : $title')],
        ),
      ),
    );
  }
}
