import 'dart:html';
import 'utils/conversion.dart';
import 'utils/format.dart';
import 'utils/aprifile.dart';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;
ButtonElement conversione = querySelector('#conversione') as ButtonElement;
ButtonElement formattazione = querySelector('#formattazione') as ButtonElement;
ButtonElement apriFile = querySelector("#apriFile") as ButtonElement;

void main() {
  invio.onClick.listen((Event e) {
    var contenuto = input.value as String;
    output.value = '';
    leggi(contenuto, "");
  });

  void clearTextArea(TextAreaElement textArea) {
    textArea.value = "";
  }

  pulire.onClick.listen((Event e) {
    clearTextArea(input);
    clearTextArea(output);
  });

  conversione.onClick.listen((Event e) {
    var contenuto = input.value as String;
    output.value = '';
    leggi(contenuto, "");
  });

  formattazione.onClick.listen((Event e) {
    formatJSON();
  });

  apriFile.onClick.listen((Event e) {
    caricamentoFile();
  });
}
