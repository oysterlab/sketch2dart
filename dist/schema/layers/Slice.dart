import './AbstractLayer.dart';

class Slice extends AbstractLayer {
  final String _class = "slice";
  bool hasBackgroundColor;
  Object backgroundColor;

  Slice();

  static setModelWithMap(Map<String, dynamic> map, Slice model) {
    AbstractLayer.setModelWithMap(map, model);

    model.hasBackgroundColor = map['hasBackgroundColor'];

    model.backgroundColor = map['backgroundColor'];

	}

  factory Slice.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Slice model = Slice();
	  Slice.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Slice()';
  }

} 
 