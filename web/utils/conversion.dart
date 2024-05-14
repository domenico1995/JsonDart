import 'dart:convert';
import 'dart:html';

TextAreaElement output = querySelector('#output') as TextAreaElement;

void leggi(String contenutoJson, String space) {
  try {
    contenutoJson = fixJson(contenutoJson);
    dynamic contenuto = jsonDecode(contenutoJson);
    if (contenuto is List) {
      processoJsonArray(contenuto, '', space);
    } else if (contenuto is Map<String, dynamic>) {
      processoJsonObject(contenuto, '', space);
    } else {
      output.value = 'Il JSON non è né un oggetto né una lista.';
    }
  } catch (e) {
    print('errore testo: $contenutoJson');
  }
}

void processoJsonObject(
    Map<String, dynamic> jsonObject, String parentKey, String space) {
  var s = "";
  jsonObject.forEach((key, value) {
    var displayValue = value?.toString() ?? 'null';
    s = space;

    if (controlloTesto(displayValue)) {
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

String fixJson(String jsonString) {
  jsonString =
      jsonString.replaceAll(RegExp(r'(?<!\\)"(.*?)"(?<!\\)"'), r'\"$1\"');

  jsonString = jsonString
      .replaceAllMapped(RegExp(r'"([^"]+)": "([^"]+)": "(.*?)"'), (match) {
    return '"${match.group(1)}": "${match.group(2)}: ${match.group(3)}"';
  });

  return jsonString;
}
