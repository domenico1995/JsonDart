import 'dart:convert';
import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulire_input = querySelector('#clear_input') as ButtonElement;
ButtonElement pulire_output = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;

Future<void> main() async {
  //test per vedere se è possibile leggere ciò che è presente nell textarea input
  //i print servono per vedere se i listen funzionano
  invio.onClick.listen((Event e) {
    print(invio.value);//da come risultato vuoto, non prende niente
    scrivi();
    print("prova");
  });
  //i metodi successivi dovrebbero pulire le textarea ma non lo fanno, rimangono piene
  //pulire textarea input e output 
  pulire.onClick.listen((Event e) {
    input.children.clear();
    output.children.clear();
    print("prova1");
  });
  //pulire textarea input ma non puliscono
  pulire_input.onClick.listen((event) {
    input.children.clear();
     print("prova2");
  });
  //pulire textarea output
  pulire_output.onClick.listen((event) {
    output.children.clear();
     print("prova3");
  });
}

Future<void> scrivi() async {
  String fileNome = 'test.json';
  var contenutoJson = await HttpRequest.getString(fileNome);
  var contenuto = jsonDecode(contenutoJson) as List<dynamic>;
  for (int i = 0; i < contenuto.length; i++) {
    var m = contenuto[i] as Map;
    var lista = LIElement();
    lista.text =
        m['name'] + ' ' + m['item'] + ' [' + m['lat'] + '] [' + m['lon'] + ']';
    //dovrebbe aggiungere lista nell'textarea output ma non succede rimane vuota o non cambia
    output.append(lista);
  }
}
