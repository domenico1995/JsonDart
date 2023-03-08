import 'dart:convert';
import 'dart:html';
//Variabile di collegamento tra <ul> e il codice dart
final UListElement lista = querySelector('#lista') as UListElement;

Future<void> main() async {
  //fileNome contiene il nome del file
  String fileNome = 'test.json';
  //contenutoJson contiene il testo del file
  var contenutoJson = await HttpRequest.getString(fileNome);
  //crea una lista dalla conversione da json
  var contenuto = jsonDecode(contenutoJson) as List<dynamic>;
  //ogni elemento della lista viene usato come Map e i suoi elementi dati per essere visulaizzati
  for (int i = 0; i < contenuto.length; i++) {
    var m = contenuto[i] as Map;
    var listElement = LIElement();
    listElement.text =
        m['name'] + ' ' + m['item'] + ' [' + m['lat'] + '] [' + m['lon'] + ']';
    lista.children.add(listElement);
  }
}
