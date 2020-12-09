
class SharedStyle {
  final String _class = "sharedStyle";
  String do_objectID;
  String name;
  Object value;

  SharedStyle();

  static setModelWithMap(Map<String, dynamic> map, SharedStyle model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

    model.value = map['value'];

	}

  factory SharedStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SharedStyle model = SharedStyle();
	  SharedStyle.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SharedStyle()';
  }

} 
 