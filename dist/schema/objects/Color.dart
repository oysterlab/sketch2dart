
class Color {
  final String _class = "color";
  double alpha;
  double red;
  double green;
  double blue;
  String swatchID;

  Color();

  static setModelWithMap(Map<String, dynamic> map, Color model) {
    model.alpha = map['alpha'];

    model.red = map['red'];

    model.green = map['green'];

    model.blue = map['blue'];

    model.swatchID = map['swatchID'];

	}

  factory Color.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Color model = Color();
	  Color.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Color()';
  }

} 
 