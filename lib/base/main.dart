import 'package:flutter/material.dart';
import 'package:future_builder/Views/home.dart';

void main() {
  runApp(const FutureBuilder());
}

class FutureBuilder extends StatelessWidget {
  const FutureBuilder({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

