import './AbstractLayer.dart';
import '../objects/OverrideValue.dart';

class SymbolInstance extends AbstractLayer {
  final String _class = "symbolInstance";
  List overrideValues;
  double scale;
  String symbolID;
  double verticalSpacing;
  double horizontalSpacing;

  SymbolInstance();

  static setModelWithMap(Map<String, dynamic> map, SymbolInstance model) {
    AbstractLayer.setModelWithMap(map, model);

    if (map['overrideValues'] != null) {
       model.overrideValues = map['overrideValues'].map((d) => new OverrideValue.fromMap(d)).toList();
    }

    model.scale = map['scale'] != null ? map['scale'].toDouble() : 0.0;

    model.symbolID = map['symbolID'];

    model.verticalSpacing = map['verticalSpacing'] != null ? map['verticalSpacing'].toDouble() : 0.0;

    model.horizontalSpacing = map['horizontalSpacing'] != null ? map['horizontalSpacing'].toDouble() : 0.0;

	}

  factory SymbolInstance.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolInstance model = SymbolInstance();
	  SymbolInstance.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolInstance()';
  }

} 
