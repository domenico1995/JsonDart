import 'dart:html';
import 'utils/conversion.dart';
import 'utils/format.dart';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulireInput = querySelector('#clear_input') as ButtonElement;
ButtonElement pulireOutput = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;
ButtonElement conversione = querySelector('#conversione') as ButtonElement;
ButtonElement formattazione = querySelector('#formattazione') as ButtonElement;

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

  pulireInput.onClick.listen((event) {
    clearTextArea(input);
  });

  pulireOutput.onClick.listen((event) {
    clearTextArea(output);
  });

  conversione.onClick.listen((Event e) {
    var contenuto = input.value as String;
    output.value = '';
    leggi(contenuto, "");
  });

  formattazione.onClick.listen((Event e) {
    formatJSON(input, output);
  });
}
