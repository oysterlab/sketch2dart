
class Shadow {
  final String _class = "shadow";
  bool isEnabled;
  double blurRadius;
  Object color;
  Object contextSettings;
  double offsetX;
  double offsetY;
  double spread;

  Shadow();

  static setModelWithMap(Map<String, dynamic> map, Shadow model) {
    model.isEnabled = map['isEnabled'];

    model.blurRadius = map['blurRadius'] != null ? map['blurRadius'].toDouble() : 0.0;

    model.color = map['color'];

    model.contextSettings = map['contextSettings'];

    model.offsetX = map['offsetX'] != null ? map['offsetX'].toDouble() : 0.0;

    model.offsetY = map['offsetY'] != null ? map['offsetY'].toDouble() : 0.0;

    model.spread = map['spread'] != null ? map['spread'].toDouble() : 0.0;

	}

  factory Shadow.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Shadow model = Shadow();
	  Shadow.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Shadow()';
  }

} 
 