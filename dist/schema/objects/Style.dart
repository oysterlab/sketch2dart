import './BorderOptions.dart';
import './Blur.dart';
import './TextStyle.dart';
import './GraphicsContextSettings.dart';
import './ColorControls.dart';
import './Border.dart';
import './Fill.dart';
import './Shadow.dart';
import './InnerShadow.dart';

class Style {
  final String _class = "style";
  String do_objectID;
  List borders;
  BorderOptions borderOptions;
  Blur blur;
  List fills;
  int startMarkerType;
  int endMarkerType;
  int miterLimit;
  int windingRule;
  TextStyle textStyle;
  List shadows;
  List innerShadows;
  GraphicsContextSettings contextSettings;
  ColorControls colorControls;

  Style();

  static setModelWithMap(Map<String, dynamic> map, Style model) {
    model.do_objectID = map['do_objectID'];

    if (map['borders'] != null) {
       model.borders = map['borders'].map((d) => new Border.fromMap(d)).toList();
    }

    model.borderOptions = map['borderOptions'] != null ? new BorderOptions.fromMap(map['borderOptions']) : null;

    model.blur = map['blur'] != null ? new Blur.fromMap(map['blur']) : null;

    if (map['fills'] != null) {
       model.fills = map['fills'].map((d) => new Fill.fromMap(d)).toList();
    }

    model.startMarkerType = map['startMarkerType'];

    model.endMarkerType = map['endMarkerType'];

    model.miterLimit = map['miterLimit'];

    model.windingRule = map['windingRule'];

    model.textStyle = map['textStyle'] != null ? new TextStyle.fromMap(map['textStyle']) : null;

    if (map['shadows'] != null) {
       model.shadows = map['shadows'].map((d) => new Shadow.fromMap(d)).toList();
    }

    if (map['innerShadows'] != null) {
       model.innerShadows = map['innerShadows'].map((d) => new InnerShadow.fromMap(d)).toList();
    }

    model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;

    model.colorControls = map['colorControls'] != null ? new ColorControls.fromMap(map['colorControls']) : null;

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
