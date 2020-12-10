import './Gradient.dart';

class GradientAsset {
  final String _class = "MSImmutableGradientAsset";
  String do_objectID;
  String name;
  Gradient gradient;

  GradientAsset();

  static setModelWithMap(Map<String, dynamic> map, GradientAsset model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

    model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;

	}

  factory GradientAsset.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GradientAsset model = GradientAsset();
	  GradientAsset.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'GradientAsset()';
  }

} 
