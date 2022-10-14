import 'package:flutter/material.dart';

import 'views/home.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:const MyHomePage(),
    );
  }
}

