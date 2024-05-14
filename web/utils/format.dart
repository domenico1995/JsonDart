import 'dart:convert' as json;
import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;

void formatJSON() {
  try {
    var inputContent = input.value!;
    var parsedContent = json.jsonDecode(inputContent);
    var formattedJson =
        json.JsonEncoder.withIndent('  ').convert(parsedContent);
    output.value = formattedJson;
  } catch (e) {
    window.alert('JSON non valido');
  }
}
