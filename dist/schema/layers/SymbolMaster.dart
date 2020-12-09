import './AbstractGroup.dart';
import '../objects/OverrideProperty.dart';

class SymbolMaster extends AbstractGroup {
  final String _class = "symbolMaster";
  Object backgroundColor;
  bool hasBackgroundColor;
  Object horizontalRulerData;
  bool includeBackgroundColorInExport;
  bool includeInCloudUpload;
  bool isFlowHome;
  bool resizesContent;
  Object verticalRulerData;
  bool includeBackgroundColorInInstance;
  String symbolID;
  bool allowsOverrides;
  List overrideProperties;
  dynamic presetDictionary;

  SymbolMaster();

  static setModelWithMap(Map<String, dynamic> map, SymbolMaster model) {
    AbstractGroup.setModelWithMap(map, model);

    model.backgroundColor = map['backgroundColor'];

    model.hasBackgroundColor = map['hasBackgroundColor'];

    model.horizontalRulerData = map['horizontalRulerData'];

    model.includeBackgroundColorInExport = map['includeBackgroundColorInExport'];

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.isFlowHome = map['isFlowHome'];

    model.resizesContent = map['resizesContent'];

    model.verticalRulerData = map['verticalRulerData'];

    model.includeBackgroundColorInInstance = map['includeBackgroundColorInInstance'];

    model.symbolID = map['symbolID'];

    model.allowsOverrides = map['allowsOverrides'];

    if (map['overrideProperties']) {
       model.overrideProperties = map['overrideProperties'].map((d) => new OverrideProperty.fromMap(d));
    }

    model.presetDictionary = map['presetDictionary'];

	}

  factory SymbolMaster.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolMaster model = SymbolMaster();
	  SymbolMaster.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolMaster()';
  }

} 
 
class SymbolMaster_PresetDictionary {

  SymbolMaster_PresetDictionary();

  static setModelWithMap(Map<String, dynamic> map, SymbolMaster_PresetDictionary model) {
	}

  factory SymbolMaster_PresetDictionary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolMaster_PresetDictionary model = SymbolMaster_PresetDictionary();
	  SymbolMaster_PresetDictionary.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolMaster_PresetDictionary()';
  }

} 
 