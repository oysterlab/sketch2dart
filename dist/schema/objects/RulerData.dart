
class RulerData {
  final String _class = "rulerData";
  int base;
  List guides;

  RulerData();

  static setModelWithMap(Map<String, dynamic> map, RulerData model) {
    model.base = map['base'];

    model.guides = List<int>.from(map['guides']);

	}

  factory RulerData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RulerData model = RulerData();
	  RulerData.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'RulerData()';
  }

} 
 