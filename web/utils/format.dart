import 'dart:convert' as json;
import 'dart:html';

void formatJSON(TextAreaElement input, TextAreaElement output) {
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
