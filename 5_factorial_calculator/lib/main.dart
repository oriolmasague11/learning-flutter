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
        appBar: AppBar(
          title: Text("Calculator")
        ),
        body: Center(
          child: Calculator(), 
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key}); 

  @override
  State<Calculator> createState() => CalculatorState(0); 

}

class CalculatorState extends State<Calculator> {
  int result; 
  CalculatorState(this.result);
  
  setResult(int newValue) {
    result = newValue; 
    setState(() {
      
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$result", style: TextStyle(fontSize: 48),), 
        Factorial(setResult), 
      ],
    );
  }
}

class Factorial extends StatelessWidget {

  Function update;
  final controller = TextEditingController(); 
  Factorial(this.update, {super.key});

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 48),
          controller: controller, 
        ), 
        TextButton(
          onPressed: () => update(factorial(int.parse(controller.text))),
          child: Text("Factorial"), 
        )
      ],
    );
  }


}

int factorial(int n) {
  if(n == 0) return 1; 
  return n * factorial(n-1); 
}