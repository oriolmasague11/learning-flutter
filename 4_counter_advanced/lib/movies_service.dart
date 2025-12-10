import 'dart:convert';
import 'package:http/http.dart' as http; 
// > flutter pub add http 

String endpoint = "https://omdbapi.com/";
String apikey = "ff183404";

//retornar dynamic, es retornar qualsevol cosa
//future es un objecte que no saps quan arribara pero que et promet que arribara, perq es asincron 
//Future: Es una promesa de que en algún momento tendrás un valor (o un error).
Future<List<dynamic>> search(String input) async {  //await sol funciona per asincronous funtions

  if(input == "") {
    return []; 
  }

  //var url = Uri.parse("$endpoint?apikey=$apikey&s=$input");
  var url = Uri.parse("$endpoint?apikey=$apikey&s=$input");  //ns perq el endpoint no funciona
  var response = await http.get(url); //await: wait for the call to complete
  // altrament tindrem algo que es completara en un futur. Haurem de gestionar-ho 
  final responseJson = json.decode(response.body);  //ha de descomposar un string 

  if(responseJson["Search"] != null) {
    return responseJson["Search"] //llista de json objectes, cadascun d'ells representant una pelicula 
      .where((movie) => movie["Poster"] != "N/A")
      .toList(); 
  } 

  //else
  return []; 
}

findMovie(String id) async {

  var url = Uri.parse("$endpoint?apikey=$apikey&i=$id"); 

  // Calling API and decoding the response
  return json.decode((await http.get(url)).body);

}
