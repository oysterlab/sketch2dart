import './Swatch.dart';

class SwatchContainer {
  final String _class = "swatchContainer";
  String do_objectID;
  List objects;

  SwatchContainer();

  static setModelWithMap(Map<String, dynamic> map, SwatchContainer model) {
    model.do_objectID = map['do_objectID'];

    if (map['objects']) {
       model.objects = map['objects'].map((d) => new Swatch.fromMap(d));
    }

	}

  factory SwatchContainer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SwatchContainer model = SwatchContainer();
	  SwatchContainer.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SwatchContainer()';
  }

} 
 