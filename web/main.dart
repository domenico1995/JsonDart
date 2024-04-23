import 'dart:convert';
import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;
TextAreaElement output = querySelector('#output') as TextAreaElement;
ButtonElement pulire = querySelector('#clear_all') as ButtonElement;
ButtonElement pulireInput = querySelector('#clear_input') as ButtonElement;
ButtonElement pulireOutput = querySelector('#clear_output') as ButtonElement;
ButtonElement invio = querySelector('#invio') as ButtonElement;

void main() {
  print("hello world");
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
}

void leggi(String contenutoJson, String space) {
  try {
    dynamic contenuto = jsonDecode(contenutoJson);
    if (contenuto is List) {
      processoJsonArray(contenuto, '', space);
    } else if (contenuto is Map<String, dynamic>) {
      processoJsonObject(contenuto, '', space);
    } else {
      output.value = 'Il JSON non è né un oggetto né una lista.';
    }
  } catch (e) {
    print("errore");
  }
}

void processoJsonObject(
    Map<String, dynamic> jsonObject, String parentKey, String space) {
  var s = "";
  jsonObject.forEach((key, value) {
    var displayValue = value?.toString() ?? 'null';
    s = space;

    if (controlloTesto(displayValue)) {
      print('$space$key: \n');
      output.value = '${output.value ?? ''}$space$key:\n';
      space = '$space   ';
      leggi(modificaTesto(displayValue), space);
      space = s;
    } else {
      print('$space$key: $displayValue');
      output.value = '${output.value ?? ''}$space$key: $displayValue\n';
    }
  });
}

void processoJsonArray(
    List<dynamic> jsonArray, String parentKey, String space) {
  var s = "";
  for (int i = 0; i < jsonArray.length; i++) {
    var item = jsonArray[i];
    s = space;

    if (item is Map<String, dynamic>) {
      processoJsonObject(item, '$parentKey[$i]', space);
    } else {
      final displayValue = item?.toString() ?? 'null';
      if (controlloTesto(displayValue)) {
        output.value = '$space${output.value ?? ''}$parentKey:\n';
        space = '$space   ';
        leggi(modificaTesto(displayValue), space);
        space = s;
      } else {
        print('$space$parentKey:$displayValue\n');
        output.value = '${output.value ?? ''}$space$parentKey:$displayValue\n';
      }
    }
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
