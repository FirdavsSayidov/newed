import 'package:flutter/material.dart';
import 'package:newed/homePage.dart';
import 'package:newed/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      routes: {
        images.id:(context)=>images(),
      },
    );
  }
}
