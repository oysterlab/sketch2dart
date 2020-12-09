
class ForeignSwatch {
  final String _class = "MSImmutableForeignSwatch";
  String do_objectID;
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  String remoteSwatchID;
  Object localSwatch;

  ForeignSwatch();

  static setModelWithMap(Map<String, dynamic> map, ForeignSwatch model) {
    model.do_objectID = map['do_objectID'];

    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.remoteSwatchID = map['remoteSwatchID'];

    model.localSwatch = map['localSwatch'];

	}

  factory ForeignSwatch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignSwatch model = ForeignSwatch();
	  ForeignSwatch.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignSwatch()';
  }

} 
 