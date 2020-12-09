
class Border {
  final String _class = "border";
  bool isEnabled;
  Object color;
  int fillType;
  int position;
  double thickness;
  Object contextSettings;
  Object gradient;

  Border();

  static setModelWithMap(Map<String, dynamic> map, Border model) {
    model.isEnabled = map['isEnabled'];

    model.color = map['color'];

    model.fillType = map['fillType'];

    model.position = map['position'];

    model.thickness = map['thickness'] != null ? map['thickness'].toDouble() : 0.0;

    model.contextSettings = map['contextSettings'];

    model.gradient = map['gradient'];

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
 