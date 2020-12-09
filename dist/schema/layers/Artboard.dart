import './AbstractGroup.dart';

class Artboard extends AbstractGroup {
  final String _class = "artboard";
  bool includeInCloudUpload;
  bool includeBackgroundColorInExport;
  Object horizontalRulerData;
  Object verticalRulerData;
  Object layout;
  Object grid;
  Object backgroundColor;
  bool hasBackgroundColor;
  bool isFlowHome;
  bool resizesContent;
  dynamic presetDictionary;

  Artboard();

  static setModelWithMap(Map<String, dynamic> map, Artboard model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.includeBackgroundColorInExport = map['includeBackgroundColorInExport'];

    model.horizontalRulerData = map['horizontalRulerData'];

    model.verticalRulerData = map['verticalRulerData'];

    model.layout = map['layout'];

    model.grid = map['grid'];

    model.backgroundColor = map['backgroundColor'];

    model.hasBackgroundColor = map['hasBackgroundColor'];

    model.isFlowHome = map['isFlowHome'];

    model.resizesContent = map['resizesContent'];

    model.presetDictionary = map['presetDictionary'];

	}

  factory Artboard.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Artboard model = Artboard();
	  Artboard.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Artboard()';
  }

} 
 
class Artboard_PresetDictionary {

  Artboard_PresetDictionary();

  static setModelWithMap(Map<String, dynamic> map, Artboard_PresetDictionary model) {
	}

  factory Artboard_PresetDictionary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Artboard_PresetDictionary model = Artboard_PresetDictionary();
	  Artboard_PresetDictionary.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Artboard_PresetDictionary()';
  }

} 
 