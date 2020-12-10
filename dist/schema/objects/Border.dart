import './Color.dart';
import './GraphicsContextSettings.dart';
import './Gradient.dart';

class Border {
  final String _class = "border";
  bool isEnabled;
  Color color;
  int fillType;
  int position;
  double thickness;
  GraphicsContextSettings contextSettings;
  Gradient gradient;

  Border();

  static setModelWithMap(Map<String, dynamic> map, Border model) {
    model.isEnabled = map['isEnabled'];

    model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;

    model.fillType = map['fillType'];

    model.position = map['position'];

    model.thickness = map['thickness'] != null ? map['thickness'].toDouble() : 0.0;

    model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;

    model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;

	}

  factory Border.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Border model = Border();
	  Border.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Border()';
  }

} 
