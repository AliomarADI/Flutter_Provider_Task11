import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
          centerTitle: true,
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  Random random = new Random();
  int indexColor = 0;

  void changeIndexColor() {
    setState(() {
      indexColor = random.nextInt(4);
    });
  }

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedContainer(
            width: 200,
            height: 200,
            color: colors[indexColor],
            duration: Duration(seconds: 1),
          ),
          Switch(
            value: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value;
              });
              changeIndexColor();
            },
            activeTrackColor: Colors.yellow,
            activeColor: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}
