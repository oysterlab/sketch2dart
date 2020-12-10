import './AbstractGroup.dart';
import '../objects/RulerData.dart';
import '../objects/RulerData.dart';
import '../objects/LayoutGrid.dart';
import '../objects/SimpleGrid.dart';
import '../objects/Color.dart';

class Artboard extends AbstractGroup {
  final String _class = "artboard";
  bool includeInCloudUpload;
  bool includeBackgroundColorInExport;
  RulerData horizontalRulerData;
  RulerData verticalRulerData;
  LayoutGrid layout;
  SimpleGrid grid;
  Color backgroundColor;
  bool hasBackgroundColor;
  bool isFlowHome;
  bool resizesContent;
  dynamic presetDictionary;

  Artboard();

  static setModelWithMap(Map<String, dynamic> map, Artboard model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.includeBackgroundColorInExport = map['includeBackgroundColorInExport'];

    model.horizontalRulerData = map['horizontalRulerData'] != null ? new RulerData.fromMap(map['horizontalRulerData']) : null;

    model.verticalRulerData = map['verticalRulerData'] != null ? new RulerData.fromMap(map['verticalRulerData']) : null;

    model.layout = map['layout'] != null ? new LayoutGrid.fromMap(map['layout']) : null;

    model.grid = map['grid'] != null ? new SimpleGrid.fromMap(map['grid']) : null;

    model.backgroundColor = map['backgroundColor'] != null ? new Color.fromMap(map['backgroundColor']) : null;

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
