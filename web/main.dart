import 'dart:convert';
import 'dart:html';

//Variabile di collegamento tra <ul> e il codice dart
TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulire_input = querySelector('#clear_input') as ButtonElement;
ButtonElement pulire_output = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;

Future<void> main() async {
  invio.onClick.listen((Event e) {
    scrivi();
  });
  pulire.onClick.listen((Event e) {
    print("pulire ");
    input.children.clear();
    output.children.clear();
  });
  pulire_input.onClick.listen((event) {
    print("hello");
    input.children.clear();
  });
  pulire_output.onClick.listen((event) {
    output.children.clear();
  });
}

Future<void> scrivi() async {
  print("nome");
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
    output.append(listElement);
  }
  print("he");
}
