import '../layers/SymbolMaster.dart';
import '../layers/SymbolMaster.dart';

class ForeignSymbol {
  final String _class = "MSImmutableForeignSymbol";
  String do_objectID;
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  SymbolMaster originalMaster;
  SymbolMaster symbolMaster;
  bool missingLibraryFontAcknowledged;

  ForeignSymbol();

  static setModelWithMap(Map<String, dynamic> map, ForeignSymbol model) {
    model.do_objectID = map['do_objectID'];

    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.originalMaster = map['originalMaster'] != null ? new SymbolMaster.fromMap(map['originalMaster']) : null;

    model.symbolMaster = map['symbolMaster'] != null ? new SymbolMaster.fromMap(map['symbolMaster']) : null;

    model.missingLibraryFontAcknowledged = map['missingLibraryFontAcknowledged'];

	}

  factory ForeignSymbol.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignSymbol model = ForeignSymbol();
	  ForeignSymbol.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignSymbol()';
  }

} 
