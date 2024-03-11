import 'dart:convert';
import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulire_input = querySelector('#clear_input') as ButtonElement;
ButtonElement pulire_output = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;

void main() {
  invio.onClick.listen((Event e) {
    scrivi();
  });

  void clearTextArea(TextAreaElement textArea) {
    textArea.value = "";
  }

  pulire.onClick.listen((Event e) {
    clearTextArea(input);
    clearTextArea(output);
  });

  pulire_input.onClick.listen((event) {
    clearTextArea(input);
  });

  pulire_output.onClick.listen((event) {
    clearTextArea(output);
  });
}

void processJsonObject(Map<String, dynamic> jsonObject, String parentKey) {
  jsonObject.forEach((key, value) {
    final displayKey = key ?? 'null';
    final displayValue = value?.toString() ?? 'null';
    output.value ??= '';
    output.value = '${output.value ?? ''}$displayKey: $displayValue\n';
  });
}

void processJsonArray(List<dynamic> jsonArray, String parentKey) {
  for (int i = 0; i < jsonArray.length; i++) {
    final item = jsonArray[i];
    if (item is Map<String, dynamic>) {
      processJsonObject(item, '$parentKey[$i]');
    } else {
      final displayValue = item?.toString() ?? 'null';
      output.value ??= '';
      output.value = '${output.value ?? ''}$parentKey[$i]: $displayValue\n';
    }
  }
}

void scrivi() {
  var contenutoJson = input.value as String;
  try {
    dynamic contenuto = jsonDecode(contenutoJson);
    print(contenuto);
    output.value = '';
    if (contenuto is List) {
      processJsonArray(contenuto, '');
    } else if (contenuto is Map<String, dynamic>) {
      processJsonObject(contenuto, '');
    } else {
      output.value = 'Il JSON non è né un oggetto né una lista.';
    }
  } catch (e) {
    output.value = 'Errore durante il parsing JSON: $e';
  }
}
