import './objects/AssetCollection.dart';
import './objects/SharedStyleContainer.dart';
import './objects/SharedTextStyleContainer.dart';
import './objects/SymbolContainer.dart';
import './objects/SwatchContainer.dart';
import './objects/DocumentState.dart';
import './objects/ForeignLayerStyle.dart';
import './objects/ForeignSymbol.dart';
import './objects/ForeignTextStyle.dart';
import './objects/ForeignSwatch.dart';
import './objects/FontRef.dart';

class AbstractDocument {
  final String _class = "document";
  String do_objectID;
  AssetCollection assets;
  int colorSpace;
  int currentPageIndex;
  List foreignLayerStyles;
  List foreignSymbols;
  List foreignTextStyles;
  List foreignSwatches;
  SharedStyleContainer layerStyles;
  SharedTextStyleContainer layerTextStyles;
  SymbolContainer layerSymbols;
  SwatchContainer sharedSwatches;
  List fontReferences;
  DocumentState documentState;

  AbstractDocument();

  static setModelWithMap(Map<String, dynamic> map, AbstractDocument model) {
    model.do_objectID = map['do_objectID'];

    model.assets = map['assets'] != null ? new AssetCollection.fromMap(map['assets']) : null;

    model.colorSpace = map['colorSpace'];

    model.currentPageIndex = map['currentPageIndex'];

    if (map['foreignLayerStyles'] != null) {
       model.foreignLayerStyles = map['foreignLayerStyles'].map((d) => new ForeignLayerStyle.fromMap(d)).toList();
    }

    if (map['foreignSymbols'] != null) {
       model.foreignSymbols = map['foreignSymbols'].map((d) => new ForeignSymbol.fromMap(d)).toList();
    }

    if (map['foreignTextStyles'] != null) {
       model.foreignTextStyles = map['foreignTextStyles'].map((d) => new ForeignTextStyle.fromMap(d)).toList();
    }

    if (map['foreignSwatches'] != null) {
       model.foreignSwatches = map['foreignSwatches'].map((d) => new ForeignSwatch.fromMap(d)).toList();
    }

    model.layerStyles = map['layerStyles'] != null ? new SharedStyleContainer.fromMap(map['layerStyles']) : null;

    model.layerTextStyles = map['layerTextStyles'] != null ? new SharedTextStyleContainer.fromMap(map['layerTextStyles']) : null;

    model.layerSymbols = map['layerSymbols'] != null ? new SymbolContainer.fromMap(map['layerSymbols']) : null;

    model.sharedSwatches = map['sharedSwatches'] != null ? new SwatchContainer.fromMap(map['sharedSwatches']) : null;

    if (map['fontReferences'] != null) {
       model.fontReferences = map['fontReferences'].map((d) => new FontRef.fromMap(d)).toList();
    }

    model.documentState = map['documentState'] != null ? new DocumentState.fromMap(map['documentState']) : null;

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
