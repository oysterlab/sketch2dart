
class ForeignTextStyle {
  final String _class = "MSImmutableForeignTextStyle";
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  String remoteStyleID;
  Object localSharedStyle;
  bool missingLibraryFontAcknowledged;

  ForeignTextStyle();

  static setModelWithMap(Map<String, dynamic> map, ForeignTextStyle model) {
    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.remoteStyleID = map['remoteStyleID'];

    model.localSharedStyle = map['localSharedStyle'];

    model.missingLibraryFontAcknowledged = map['missingLibraryFontAcknowledged'];

	}

  factory ForeignTextStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignTextStyle model = ForeignTextStyle();
	  ForeignTextStyle.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignTextStyle()';
  }

} 
 