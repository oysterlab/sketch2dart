
class InnerShadow {
  final String _class = "innerShadow";
  bool isEnabled;
  double blurRadius;
  Object color;
  Object contextSettings;
  double offsetX;
  double offsetY;
  double spread;

  InnerShadow();

  static setModelWithMap(Map<String, dynamic> map, InnerShadow model) {
    model.isEnabled = map['isEnabled'];

    model.blurRadius = map['blurRadius'] != null ? map['blurRadius'].toDouble() : 0.0;

    model.color = map['color'];

    model.contextSettings = map['contextSettings'];

    model.offsetX = map['offsetX'] != null ? map['offsetX'].toDouble() : 0.0;

    model.offsetY = map['offsetY'] != null ? map['offsetY'].toDouble() : 0.0;

    model.spread = map['spread'] != null ? map['spread'].toDouble() : 0.0;

	}

  factory InnerShadow.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    InnerShadow model = InnerShadow();
	  InnerShadow.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'InnerShadow()';
  }

} 
 