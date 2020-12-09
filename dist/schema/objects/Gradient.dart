import './GradientStop.dart';

class Gradient {
  final String _class = "gradient";
  int gradientType;
  double elipseLength;
  String from;
  String to;
  List stops;

  Gradient();

  static setModelWithMap(Map<String, dynamic> map, Gradient model) {
    model.gradientType = map['gradientType'];

    model.elipseLength = map['elipseLength'] != null ? map['elipseLength'].toDouble() : 0.0;

    model.from = map['from'];

    model.to = map['to'];

    if (map['stops']) {
       model.stops = map['stops'].map((d) => new GradientStop.fromMap(d));
    }

	}

  factory Gradient.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Gradient model = Gradient();
	  Gradient.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Gradient()';
  }

} 
 