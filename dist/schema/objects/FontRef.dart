import './DataRef.dart';

class FontRef {
  final String _class = "fontReference";
  DataRef fontData;
  String fontFamilyName;
  String fontFileName;
  int options;
  List postscriptNames;

  FontRef();

  static setModelWithMap(Map<String, dynamic> map, FontRef model) {
    model.fontData = map['fontData'] != null ? new DataRef.fromMap(map['fontData']) : null;

    model.fontFamilyName = map['fontFamilyName'];

    model.fontFileName = map['fontFileName'];

    model.options = map['options'];

    model.postscriptNames = List<String>.from(map['postscriptNames']);

	}

  factory FontRef.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontRef model = FontRef();
	  FontRef.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontRef()';
  }

} 
