
class Swatch {
  final String _class = "swatch";
  String do_objectID;
  String name;
  Object value;

  Swatch();

  static setModelWithMap(Map<String, dynamic> map, Swatch model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

    model.value = map['value'];

	}

  factory Swatch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Swatch model = Swatch();
	  Swatch.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Swatch()';
  }

} 
 