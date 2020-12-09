import './AbstractLayer.dart';
import '../objects/FileRef.dart';
import '../objects/DataRef.dart';

class Bitmap extends AbstractLayer {
  final String _class = "bitmap";
  bool fillReplacesImage;
  dynamic image;
  int intendedDPI;
  String clippingMask;

  Bitmap();

  static setModelWithMap(Map<String, dynamic> map, Bitmap model) {
    AbstractLayer.setModelWithMap(map, model);

    model.fillReplacesImage = map['fillReplacesImage'];

    dynamic image_t = map['image'];
    if (image_t) {
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

    model.intendedDPI = map['intendedDPI'];

    model.clippingMask = map['clippingMask'];

	}

  factory Bitmap.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Bitmap model = Bitmap();
	  Bitmap.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Bitmap()';
  }

} 
 