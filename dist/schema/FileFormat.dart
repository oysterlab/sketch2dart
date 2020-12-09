import './AbstractDocument.dart';
import './layers/Page.dart';

class FileFormat {
  FileFormat_AbstractDocument document;
  Object meta;
  Object user;
  Object workspace;

  FileFormat();

  static setModelWithMap(Map<String, dynamic> map, FileFormat model) {
    model.meta = map['meta'];

    model.user = map['user'];

    model.workspace = map['workspace'];
  }

  factory FileFormat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FileFormat model = FileFormat();
    FileFormat.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'FileFormat()';
  }
}

class FileFormat_AbstractDocument extends AbstractDocument {
  List pages;

  FileFormat_AbstractDocument();

  static setModelWithMap(Map<String, dynamic> map, FileFormat_AbstractDocument model) {
    AbstractDocument.setModelWithMap(map, model);

    if (map['pages']) {
      model.pages = map['pages'].map((d) => new Page.fromMap(d));
    }
  }

  factory FileFormat_AbstractDocument.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FileFormat_AbstractDocument model = FileFormat_AbstractDocument();
    FileFormat_AbstractDocument.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'FileFormat_AbstractDocument()';
  }
}
