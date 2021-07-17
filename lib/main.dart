import 'package:flutter/material.dart';
// import './homepage.dart';
import 'SignInpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlueAccent[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreateAccount2(),
    );
  }
}
