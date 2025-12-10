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
        appBar: AppBar(   //aixo li posa com un titul a la app
          title: const Text("Hello World"),
        ),
        body: Center(
          child: Column(  // aixo tho posa tot en una columna
            children: [
              HelloWorld(), 
              HelloWorldPlus(Colors.blue, 1), 
              HelloWorldPlus.withRedColor(2),
              HelloWorldGenerator(10),
            ],
          )
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

  const HelloWorldPlus.withRedColor(this.number, {Key? key}):
    this.color = Colors.red, 
    super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 48, color: color), 
    );
  } 
}

class HelloWorldGenerator extends StatelessWidget {

  final int size; 

  HelloWorldGenerator(this.size, {super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> childList = []; 

    for(int i = 0; i < size; i++) {
      childList.add(
        HelloWorldPlus(
            Color.fromRGBO(
              16 * i % 255, 
              32 * i % 255, 
              48 * i % 255, 
              1.0)
          , i+3)
      );
    }

    return Column(
      children: childList,
    ); 
  }

}