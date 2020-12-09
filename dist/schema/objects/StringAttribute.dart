
class StringAttribute {
  final String _class = "stringAttribute";
  int location;
  int length;
  StringAttribute_Attributes attributes;

  StringAttribute();

  static setModelWithMap(Map<String, dynamic> map, StringAttribute model) {
    model.location = map['location'];

    model.length = map['length'];

    model.attributes = map['attributes'];

	}

  factory StringAttribute.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StringAttribute model = StringAttribute();
	  StringAttribute.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'StringAttribute()';
  }

} 
 
class StringAttribute_Attributes {
  double kerning;
  int textStyleVerticalAlignmentKey;
  Object MSAttributedStringFontAttribute;
  Object MSAttributedStringColorAttribute;
  Object paragraphStyle;

  StringAttribute_Attributes();

  static setModelWithMap(Map<String, dynamic> map, StringAttribute_Attributes model) {
    model.kerning = map['kerning'] != null ? map['kerning'].toDouble() : 0.0;

    model.textStyleVerticalAlignmentKey = map['textStyleVerticalAlignmentKey'];

    model.MSAttributedStringFontAttribute = map['MSAttributedStringFontAttribute'];

    model.MSAttributedStringColorAttribute = map['MSAttributedStringColorAttribute'];

    model.paragraphStyle = map['paragraphStyle'];

	}

  factory StringAttribute_Attributes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StringAttribute_Attributes model = StringAttribute_Attributes();
	  StringAttribute_Attributes.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'StringAttribute_Attributes()';
  }

} 
 