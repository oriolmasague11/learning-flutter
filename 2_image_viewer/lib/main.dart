import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, 
        primarySwatch: Colors.teal, 
        useMaterial3: true, 
      ), 
      darkTheme: ThemeData(
        brightness: Brightness.dark,  
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Viewer")
        ),
        body: Center(
          child: MainButton()
        )
        //carrega una imatge de internet
      ),
    );
  }
}

class MainButton extends StatelessWidget {

  MainButton({super.key}); 

  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
        context: context, 
        builder: (context) => Viewer(), 
      ),
      icon: const Icon(Icons.search), 
    );
  }
}

List<String> urls = [
  "https://picsum.photos/300/300?random=1", 
  "https://picsum.photos/300/200?random=2",
  "https://picsum.photos/300/200?random=3",

];  // compte que se guarda les imatges a cache

// a = [1, 2, 3]
// a.map( (x) => x + 1 )
// [2, 3, 4]

class Viewer extends StatelessWidget {

  const Viewer({super.key});

  @override
  Widget build(BuildContext context) {

    List<Image> images = urls.map(
      (s) => Image.network(s)
    ).toList();   // o torna a convertir en llista

    // a = [4, 5, 6]
    // b = [1, 2, 4, 5, 6]
    // b = [1, 2, a] => [1, 2, [4, 5, 6]]
    // b = [1, 2, ...a] => [1, 2, 4, 5, 6]

    return Column(
      children: [
        ...images, 
      ]
    );
  }

}

