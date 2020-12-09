
class GradientStop {
  final String _class = "gradientStop";
  Object color;
  double position;

  GradientStop();

  static setModelWithMap(Map<String, dynamic> map, GradientStop model) {
    model.color = map['color'];

    model.position = map['position'];

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
 