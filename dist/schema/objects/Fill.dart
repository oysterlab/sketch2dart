import './Color.dart';
import './GraphicsContextSettings.dart';
import './Gradient.dart';
import '../objects/FileRef.dart';
import '../objects/DataRef.dart';

class Fill {
  final String _class = "fill";
  bool isEnabled;
  Color color;
  int fillType;
  double noiseIndex;
  double noiseIntensity;
  int patternFillType;
  double patternTileScale;
  GraphicsContextSettings contextSettings;
  Gradient gradient;
  dynamic image;

  Fill();

  static setModelWithMap(Map<String, dynamic> map, Fill model) {
    model.isEnabled = map['isEnabled'];

    model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;

    model.fillType = map['fillType'];

    model.noiseIndex = map['noiseIndex'] != null ? map['noiseIndex'].toDouble() : 0.0;

    model.noiseIntensity = map['noiseIntensity'] != null ? map['noiseIntensity'].toDouble() : 0.0;

    model.patternFillType = map['patternFillType'];

    model.patternTileScale = map['patternTileScale'] != null ? map['patternTileScale'].toDouble() : 0.0;

    model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;

    model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;

    dynamic image_t = map['image'];
    if (image_t != null) {
      switch(image_t['_class']) {
        case 'MSJSONFileReference':
          model.image = map['image'] != null ? new FileRef.fromMap(map['image']) : null;
          break;

        case 'MSJSONOriginalDataReference':
          model.image = map['image'] != null ? new DataRef.fromMap(map['image']) : null;
          break;

        default:
          break;
      }
    }

	}

  factory Fill.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Fill model = Fill();
	  Fill.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Fill()';
  }

} 
