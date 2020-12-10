import './AbstractDocument.dart';
import './objects/FileRef.dart';

class Document extends AbstractDocument {
  List pages;

  Document();

  static setModelWithMap(Map<String, dynamic> map, Document model) {
    AbstractDocument.setModelWithMap(map, model);

    if (map['pages'] != null) {
       model.pages = map['pages'].map((d) => new FileRef.fromMap(d)).toList();
    }

	}

  factory Document.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Document model = Document();
	  Document.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Document()';
  }

} 
