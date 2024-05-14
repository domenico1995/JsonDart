import 'dart:html';

TextAreaElement input = querySelector('#input') as TextAreaElement;

void caricamentoFile() {
  var fileInput = FileUploadInputElement();

  fileInput.onChange.listen((Event e) {
    File file = fileInput.files!.first;

    FileReader reader = FileReader();

    reader.onLoad.listen((ProgressEvent e) {
      input.value = reader.result.toString();
    });

    reader.readAsText(file);
  });

  fileInput.click();
}
