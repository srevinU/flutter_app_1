import 'package:flutter/material.dart';
import 'package:flutter_application_1/frontEnd/pages/Home.dart';
import 'package:flutter_application_1/frontEnd/pages/SignIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      // home: Home(),
    );
  }
}
