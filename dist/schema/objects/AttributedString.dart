import './StringAttribute.dart';

class AttributedString {
  final String _class = "attributedString";
  String string;
  List attributes;

  AttributedString();

  static setModelWithMap(Map<String, dynamic> map, AttributedString model) {
    model.string = map['string'];

    if (map['attributes'] != null) {
       model.attributes = map['attributes'].map((d) => new StringAttribute.fromMap(d)).toList();
    }

	}

  factory AttributedString.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AttributedString model = AttributedString();
	  AttributedString.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AttributedString()';
  }

} 
