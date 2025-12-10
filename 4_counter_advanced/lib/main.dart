import 'package:flutter/material.dart';
import 'package:classe4/movies_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'movies': (context) => MovieDetail()}, 
      home: Scaffold(
        appBar: AppBar(title: const Text("Movie Application")),
        body: Center(
          child: Movie(), 
        ),
      ),
    );
  }
}

class Movie extends StatefulWidget {

  @override   
  State<Movie> createState() => MovieState();  //la majoria de les vegades es recomanable indicar el tipus que es retorna

}

class MovieState extends State<Movie> {

  List movies = []; 

  void _update_movies(String input) async {
    movies = await search(input); 
    setState(() {});
  }

  @override   
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        TextField(
          textAlign: TextAlign.center, 
          onChanged: (input) => _update_movies(input), 
        ), 
        Expanded(
          child: ListView.builder(
            itemCount: movies.length, 
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(movies[index]["Title"]), 
                leading: Image.network(  //leading ho posa al principi
                  movies[index]["Poster"], 
                  fit: BoxFit.cover, 
                  height: 100, 
                  width: 100, 
                  errorBuilder: (context, error, StackTrace) {  //si no hi ha imatge  
                    return const SizedBox(width: 100, height: 100,); 
                  }, 
                ),
                onTap: () { //no te parametres
                  Navigator.pushNamed(  //aixo funciona com un stack q va afegint screens a la pila 
                    context, "movies", 
                    arguments: movies[index]["imdbID"],  
                  );
                }, 
              ); 
            },
          ),
        ),
      ],
    ); 
  }
}

class MovieDetail extends StatefulWidget {

  @override  
  State<MovieDetail> createState() => MovieDetailState(); 
}

class MovieDetailState extends State<MovieDetail> {

  var movie; 
  var _first = true; 

  @override   
  Widget build(BuildContext context) {

    if(_first) {
      var argument = ModalRoute.of(context)?.settings.arguments as String; 

      movie = findMovie(argument)
      .then( 
        (m) {
          movie = m; 
          setState(() {});
          _first = false; 
        }
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie Detail Screen'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: () {
              return Navigator.pop(context); 
            },
          ),
        ), 
        body: Center(
          child: Text(movie['Title']), 
        ),
      ),
    );
  }
}