import './Border.dart';
import './Fill.dart';
import './Shadow.dart';
import './InnerShadow.dart';

class Style {
  final String _class = "style";
  String do_objectID;
  List borders;
  Object borderOptions;
  Object blur;
  List fills;
  int startMarkerType;
  int endMarkerType;
  int miterLimit;
  int windingRule;
  Object textStyle;
  List shadows;
  List innerShadows;
  Object contextSettings;
  Object colorControls;

  Style();

  static setModelWithMap(Map<String, dynamic> map, Style model) {
    model.do_objectID = map['do_objectID'];

    if (map['borders']) {
       model.borders = map['borders'].map((d) => new Border.fromMap(d));
    }

    model.borderOptions = map['borderOptions'];

    model.blur = map['blur'];

    if (map['fills']) {
       model.fills = map['fills'].map((d) => new Fill.fromMap(d));
    }

    model.startMarkerType = map['startMarkerType'];

    model.endMarkerType = map['endMarkerType'];

    model.miterLimit = map['miterLimit'];

    model.windingRule = map['windingRule'];

    model.textStyle = map['textStyle'];

    if (map['shadows']) {
       model.shadows = map['shadows'].map((d) => new Shadow.fromMap(d));
    }

    if (map['innerShadows']) {
       model.innerShadows = map['innerShadows'].map((d) => new InnerShadow.fromMap(d));
    }

    model.contextSettings = map['contextSettings'];

    model.colorControls = map['colorControls'];

	}

  factory Style.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Style model = Style();
	  Style.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Style()';
  }

} 
 