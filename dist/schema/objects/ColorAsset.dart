import './Color.dart';

class ColorAsset {
  final String _class = "MSImmutableColorAsset";
  String do_objectID;
  String name;
  Color color;

  ColorAsset();

  static setModelWithMap(Map<String, dynamic> map, ColorAsset model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

    model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;

	}

  factory ColorAsset.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ColorAsset model = ColorAsset();
	  ColorAsset.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ColorAsset()';
  }

} 
