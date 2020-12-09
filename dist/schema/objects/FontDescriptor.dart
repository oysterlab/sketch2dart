
class FontDescriptor {
  final String _class = "fontDescriptor";
  FontDescriptor_Attributes attributes;

  FontDescriptor();

  static setModelWithMap(Map<String, dynamic> map, FontDescriptor model) {
    model.attributes = map['attributes'];

	}

  factory FontDescriptor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontDescriptor model = FontDescriptor();
	  FontDescriptor.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontDescriptor()';
  }

} 
 
class FontDescriptor_Attributes {
  String name;
  double size;
  dynamic variation;

  FontDescriptor_Attributes();

  static setModelWithMap(Map<String, dynamic> map, FontDescriptor_Attributes model) {
    model.name = map['name'];

    model.size = map['size'] != null ? map['size'].toDouble() : 0.0;

    model.variation = map['variation'];

	}

  factory FontDescriptor_Attributes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontDescriptor_Attributes model = FontDescriptor_Attributes();
	  FontDescriptor_Attributes.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontDescriptor_Attributes()';
  }

} 
 
class FontDescriptor_Attributes_Variation {

  FontDescriptor_Attributes_Variation();

  static setModelWithMap(Map<String, dynamic> map, FontDescriptor_Attributes_Variation model) {
	}

  factory FontDescriptor_Attributes_Variation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontDescriptor_Attributes_Variation model = FontDescriptor_Attributes_Variation();
	  FontDescriptor_Attributes_Variation.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontDescriptor_Attributes_Variation()';
  }

} 
 