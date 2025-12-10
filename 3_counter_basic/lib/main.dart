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
        appBar: AppBar(title: Text("Counter")), 
        body: Center(
          child: Counter(), 
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  
  @override 
  CounterState createState() => CounterState(); 

}

class CounterState extends State<Counter> {

  int counter = 0; 

  void incrementCounter() {
    setState(() {counter = counter + 1; });  //sino no se llimpiara la pantalla
  } 


  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        Text(
          "$counter", 
          style: TextStyle(fontSize: 48),
        ),
        IconButton(
          onPressed: () => incrementCounter(),
          icon: Icon(Icons.add)
        )
      ],
    );
    



  }

}

// CTRL + SHIFT + I 