import './AbstractShapeLayer.dart';

class Triangle extends AbstractShapeLayer {
  final String _class = "triangle";
  bool isEquilateral;

  Triangle();

  static setModelWithMap(Map<String, dynamic> map, Triangle model) {
    AbstractShapeLayer.setModelWithMap(map, model);

    model.isEquilateral = map['isEquilateral'];

	}

  factory Triangle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Triangle model = Triangle();
	  Triangle.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Triangle()';
  }

} 
