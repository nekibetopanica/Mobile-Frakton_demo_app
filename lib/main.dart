import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Service/UserService.dart';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title:'Users List',),
    );
  }
}




























