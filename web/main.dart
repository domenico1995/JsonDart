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
    leggi(contenuto);
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

void processoJsonObject(Map<String, dynamic> jsonObject, String parentKey) {
  jsonObject.forEach((key, value) {
    var displayKey = key;
    var displayValue = value?.toString() ?? 'null';
    if (controlloTesto(displayValue)) {
      output.value = '${output.value ?? ''}$displayKey:\n';
      leggi(modificaTesto(displayValue));
    } else {
      output.value = '${output.value ?? ''}$displayKey: $displayValue\n';
    }
  });
}

void processoJsonArray(List<dynamic> jsonArray, String parentKey) {
  for (int i = 0; i < jsonArray.length; i++) {
    var item = jsonArray[i];
    if (item is Map<String, dynamic>) {
      processoJsonObject(item, '$parentKey[$i]');
    } else {
      final displayValue = item?.toString() ?? 'null';
      if (controlloTesto(displayValue)) {
        output.value = '${output.value ?? ''}$parentKey [$i]:\n';
        leggi(modificaTesto(displayValue));
      } else {
        output.value = '${output.value ?? ''}$parentKey [$i]: $displayValue\n';
      }
    }
  }
}

void leggi(String contenutoJson) {
  try {
    dynamic contenuto = jsonDecode(contenutoJson);
    if (contenuto is List) {
      processoJsonArray(contenuto, '');
    } else if (contenuto is Map<String, dynamic>) {
      processoJsonObject(contenuto, '');
    } else {
      output.value = 'Il JSON non è né un oggetto né una lista.';
    }
  } catch (e) {
    print("errore");
  }
}

bool controlloTesto(String testo) {
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

  return t;
}
