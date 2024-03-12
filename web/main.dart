import 'dart:convert';
import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulireInput = querySelector('#clear_input') as ButtonElement;
ButtonElement pulireOutput = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;

void main() {
  invio.onClick.listen((Event e) {
    var contenuto = input.value as String;
    output.value = '';
    read(contenuto);
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
}

void processJsonObject(Map<String, dynamic> jsonObject, String parentKey) {
  jsonObject.forEach((key, value) {
    var displayKey = key ?? 'null';
    var displayValue = value?.toString() ?? 'null';
    output.value ??= '';
    if (controllo(displayValue)) {
      read(modificaTesto(displayValue));
    }
    output.value = '${output.value ?? ''}$displayKey: $displayValue\n';
  });
}

void processJsonArray(List<dynamic> jsonArray, String parentKey) {
  for (int i = 0; i < jsonArray.length; i++) {
    var item = jsonArray[i];
    if (item is Map<String, dynamic>) {
      processJsonObject(item, '$parentKey[$i]');
    } else {
      final displayValue = item?.toString() ?? 'null';
      output.value ??= '';
      if (controllo(displayValue)) {
        read(modificaTesto(displayValue));
      }
      output.value = '${output.value ?? ''}$parentKey[$i]: $displayValue\n';
    }
  }
}

void read(String contenutoJson) {
  try {
    dynamic contenuto = jsonDecode(contenutoJson);
    if (contenuto is List) {
      processJsonArray(contenuto, '');
    } else if (contenuto is Map<String, dynamic>) {
      processJsonObject(contenuto, '');
    } else {
      output.value = 'Il JSON non è né un oggetto né una lista.';
    }
  } catch (e) {
    print("errore");
  }
}

bool controllo(String testo) {
  if (testo.contains("{") || testo.contains("[")) {
    return true;
  } else {
    return false;
  }
}

String modificaTesto(String testo) {
  String t = testo
      .replaceAll(': ', '": "')
      .replaceAll(', ', '", "')
      .replaceAll(' {', ' {"')
      .replaceAll('}', '"}')
      .replaceAll('{', '{"')
      .replaceAll('[', '["')
      .replaceAll(']', '"]');

  t = t
      .replaceAll(': "{', ': {')
      .replaceAll(': "[', ': [')
      .replaceAll(', "{', ', {')
      .replaceAll(']",', '],')
      .replaceAll('}"]', '}]')
      .replaceAll(']"}', ']}')
      .replaceAll('}"', '}')
      .replaceAll('""', '"')
      .replaceAll('["{', '[{');

  print(t);
  return t;
}
