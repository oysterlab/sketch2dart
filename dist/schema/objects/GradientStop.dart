import './Color.dart';

class GradientStop {
  final String _class = "gradientStop";
  Color color;
  double position;

  GradientStop();

  static setModelWithMap(Map<String, dynamic> map, GradientStop model) {
    model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;

    model.position = map['position'].toDouble();

	}

  factory GradientStop.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GradientStop model = GradientStop();
	  GradientStop.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'GradientStop()';
  }

} 
