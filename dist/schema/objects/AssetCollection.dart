import './ColorAsset.dart';
import './GradientAsset.dart';
import './FileRef.dart';
import './DataRef.dart';
import './Color.dart';
import './Gradient.dart';

class AssetCollection {
  final String _class = "assetCollection";
  String do_objectID;
  Object imageCollection;
  List colorAssets;
  List gradientAssets;
  List images;
  List colors;
  List gradients;
  List exportPresets;

  AssetCollection();

  static setModelWithMap(Map<String, dynamic> map, AssetCollection model) {
    model.do_objectID = map['do_objectID'];

    model.imageCollection = map['imageCollection'];

    if (map['colorAssets']) {
       model.colorAssets = map['colorAssets'].map((d) => new ColorAsset.fromMap(d));
    }

    if (map['gradientAssets']) {
       model.gradientAssets = map['gradientAssets'].map((d) => new GradientAsset.fromMap(d));
    }
    if (map['images']) {
      model.images = map['images'].map((d) {
        dynamic model = null;
        switch(d['_class']) {
          case 'MSJSONFileReference':
            model = new FileRef.fromMap(d);
            break;

          case 'MSJSONOriginalDataReference':
            model = new DataRef.fromMap(d);
            break;

          default:
            break;
        }

        return model;
      });
    }

    if (map['colors']) {
       model.colors = map['colors'].map((d) => new Color.fromMap(d));
    }

    if (map['gradients']) {
       model.gradients = map['gradients'].map((d) => new Gradient.fromMap(d));
    }

    model.exportPresets = List.from(map['exportPresets']);

	}

  factory AssetCollection.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AssetCollection model = AssetCollection();
	  AssetCollection.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AssetCollection()';
  }

} 
 