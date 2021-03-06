
class Color {
  final String _class = "color";
  double alpha;
  double red;
  double green;
  double blue;
  String swatchID;

  dynamic noneFilteredValue;

  Color();

  static setModelWithMap(Map<String, dynamic> map, Color model) {
    model.alpha = map['alpha'].toDouble();

    model.red = map['red'].toDouble();

    model.green = map['green'].toDouble();

    model.blue = map['blue'].toDouble();

    model.swatchID = map['swatchID'];

	}

  factory Color.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Color model = Color();
	  Color.setModelWithMap(map, model);
    return model;
  }

    factory Color.fromValue(dynamic v) {
	    Color model = Color();
	    model.noneFilteredValue = v;
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
