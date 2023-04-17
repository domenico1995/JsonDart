import 'dart:convert';
import 'dart:html';

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
  //pulire textarea input ma non lo fa
  pulire.onClick.listen((Event e) {
    input.children.clear();
    output.children.clear();
  });
  //pulire textarea input ma non lo fa
  pulire_input.onClick.listen((event) {
    input.children.clear();
  });

  pulire_output.onClick.listen((event) {
    output.children.clear();
  });
}

Future<void> scrivi() async {
  var contenutoJson = input.value as String;
  var contenuto = jsonDecode(contenutoJson) as List<dynamic>;
  for (int i = 0; i < contenuto.length; i++) {
    var m = contenuto[i] as Map;
    var lista = LIElement();
    lista.text =
      m['name'] + ' ' + m['item'] + ' [' + m['lat'] + '] [' + m['lon'] + ']';
    output.appendText("${lista.text}\n");
  }
}
