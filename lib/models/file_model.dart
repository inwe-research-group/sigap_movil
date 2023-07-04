class FilesRec {
  List<FilesRec> items = [];
  FilesRec();
  FilesRec.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final fileRec = FileRec.fromJsonMap(item);
      item.add(fileRec);
    }
  }
}

class FileRec {
  String url = "";

  FileRec({
    required this.url,
  });

  FileRec.fromJsonMap(Map<String, dynamic> json) {
    this.url = json['url'];
  }
}
