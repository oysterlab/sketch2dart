import './AbstractLayer.dart';
import '../objects/FreeformGroupLayout.dart';
import '../objects/InferredGroupLayout.dart';
import './Artboard.dart';
import './Group.dart';
import './Oval.dart';
import './Polygon.dart';
import './Rectangle.dart';
import './ShapePath.dart';
import './Star.dart';
import './Triangle.dart';
import './ShapeGroup.dart';
import './Text.dart';
import './SymbolMaster.dart';
import './SymbolInstance.dart';
import './Slice.dart';
import './Hotspot.dart';
import './Bitmap.dart';

class AbstractGroup extends AbstractLayer {
  bool hasClickThrough;
  dynamic groupLayout;
  List layers;

  AbstractGroup();

  static setModelWithMap(Map<String, dynamic> map, AbstractGroup model) {
    AbstractLayer.setModelWithMap(map, model);

    model.hasClickThrough = map['hasClickThrough'];

    dynamic groupLayout_t = map['groupLayout'];
    if (groupLayout_t) {
      switch(groupLayout_t['_class']) {
        case 'MSImmutableFreeformGroupLayout':
          model.groupLayout = map['groupLayout'] != null ? new FreeformGroupLayout.fromMap(map['groupLayout']) : null;
          break;

        case 'MSImmutableInferredGroupLayout':
          model.groupLayout = map['groupLayout'] != null ? new InferredGroupLayout.fromMap(map['groupLayout']) : null;
          break;

        default:
          break;
      }
    }
    if (map['layers']) {
      model.layers = map['layers'].map((d) {
        dynamic model = null;
        switch(d['_class']) {
          case 'artboard':
            model = new Artboard.fromMap(d);
            break;

          case 'group':
            model = new Group.fromMap(d);
            break;

          case 'oval':
            model = new Oval.fromMap(d);
            break;

          case 'polygon':
            model = new Polygon.fromMap(d);
            break;

          case 'rectangle':
            model = new Rectangle.fromMap(d);
            break;

          case 'shapePath':
            model = new ShapePath.fromMap(d);
            break;

          case 'star':
            model = new Star.fromMap(d);
            break;

          case 'triangle':
            model = new Triangle.fromMap(d);
            break;

          case 'shapeGroup':
            model = new ShapeGroup.fromMap(d);
            break;

          case 'text':
            model = new Text.fromMap(d);
            break;

          case 'symbolMaster':
            model = new SymbolMaster.fromMap(d);
            break;

          case 'symbolInstance':
            model = new SymbolInstance.fromMap(d);
            break;

          case 'slice':
            model = new Slice.fromMap(d);
            break;

          case 'MSImmutableHotspotLayer':
            model = new Hotspot.fromMap(d);
            break;

          case 'bitmap':
            model = new Bitmap.fromMap(d);
            break;

          default:
            break;
        }

        return model;
      });
    }

	}

  factory AbstractGroup.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractGroup model = AbstractGroup();
	  AbstractGroup.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractGroup()';
  }

} 
 