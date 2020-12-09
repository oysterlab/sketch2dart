import './objects/ForeignLayerStyle.dart';
import './objects/ForeignSymbol.dart';
import './objects/ForeignTextStyle.dart';
import './objects/ForeignSwatch.dart';
import './objects/FontRef.dart';

class AbstractDocument {
  final String _class = "document";
  String do_objectID;
  Object assets;
  int colorSpace;
  int currentPageIndex;
  List foreignLayerStyles;
  List foreignSymbols;
  List foreignTextStyles;
  List foreignSwatches;
  Object layerStyles;
  Object layerTextStyles;
  Object layerSymbols;
  Object sharedSwatches;
  List fontReferences;
  Object documentState;

  AbstractDocument();

  static setModelWithMap(Map<String, dynamic> map, AbstractDocument model) {
    model.do_objectID = map['do_objectID'];

    model.assets = map['assets'];

    model.colorSpace = map['colorSpace'];

    model.currentPageIndex = map['currentPageIndex'];

    if (map['foreignLayerStyles']) {
       model.foreignLayerStyles = map['foreignLayerStyles'].map((d) => new ForeignLayerStyle.fromMap(d));
    }

    if (map['foreignSymbols']) {
       model.foreignSymbols = map['foreignSymbols'].map((d) => new ForeignSymbol.fromMap(d));
    }

    if (map['foreignTextStyles']) {
       model.foreignTextStyles = map['foreignTextStyles'].map((d) => new ForeignTextStyle.fromMap(d));
    }

    if (map['foreignSwatches']) {
       model.foreignSwatches = map['foreignSwatches'].map((d) => new ForeignSwatch.fromMap(d));
    }

    model.layerStyles = map['layerStyles'];

    model.layerTextStyles = map['layerTextStyles'];

    model.layerSymbols = map['layerSymbols'];

    model.sharedSwatches = map['sharedSwatches'];

    if (map['fontReferences']) {
       model.fontReferences = map['fontReferences'].map((d) => new FontRef.fromMap(d));
    }

    model.documentState = map['documentState'];

	}

  factory AbstractDocument.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractDocument model = AbstractDocument();
	  AbstractDocument.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractDocument()';
  }

} 
 