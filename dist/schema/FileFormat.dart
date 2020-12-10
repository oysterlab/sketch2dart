import './AbstractDocument.dart';
import './layers/Page.dart';
import './Meta.dart';
import './User.dart';
import './Workspace.dart';

class FileFormat {
  FileFormat_AbstractDocument document;
  Meta meta;
  User user;
  Workspace workspace;

  FileFormat();

  static setModelWithMap(Map<String, dynamic> map, FileFormat model) {
    model.meta = map['meta'] != null ? new Meta.fromMap(map['meta']) : null;

    model.user = map['user'] != null ? new User.fromMap(map['user']) : null;

    model.workspace = map['workspace'] != null ? new Workspace.fromMap(map['workspace']) : null;

	}

  factory FileFormat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FileFormat model = FileFormat();
	  FileFormat.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
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

    if (map['pages'] != null) {
       model.pages = map['pages'].map((d) => new Page.fromMap(d)).toList();
    }

	}

  factory FileFormat_AbstractDocument.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FileFormat_AbstractDocument model = FileFormat_AbstractDocument();
	  FileFormat_AbstractDocument.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FileFormat_AbstractDocument()';
  }

} 
