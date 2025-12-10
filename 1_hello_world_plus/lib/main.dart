import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: HelloWorldPlus(Colors.blue, 1),
        ),
      ),
    );
  }
}

class HelloWorld extends StatelessWidget {

  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello Worldd", style: TextStyle(fontSize: 48));
  }
}

class HelloWorldPlus extends StatelessWidget {

  final Color color; 
  final int number; 

  const HelloWorldPlus(this.color, this.number, {super.key});

  @override
  Widget build(BuildContext ctx) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 48, color: color), 
    );
  } 
}

class Counter extends StatefulWidget {
  
  @override 
  CounterState createState() => CounterState(); 

}

class CounterState extends State<Counter> {

  Widget build(BuildContext) {
    return Text("HelloWorld"); 
  }

}