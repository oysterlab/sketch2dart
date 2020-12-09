class DataRef {
  final String _class = "MSJSONOriginalDataReference";
  String _ref_class;
  String _ref;
  dynamic data;
  dynamic sha1;

  DataRef();

  static setModelWithMap(Map<String, dynamic> map, DataRef model) {
    model._ref_class = map['_ref_class'];

    model._ref = map['_ref'];

    model.data = map['data'];

    model.sha1 = map['sha1'];
  }

  factory DataRef.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataRef model = DataRef();
    DataRef.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'DataRef()';
  }
}

class DataRef_Sha1 {
  String _data;

  DataRef_Sha1();

  static setModelWithMap(Map<String, dynamic> map, DataRef_Sha1 model) {
    model._data = map['_data'];
  }

  factory DataRef_Sha1.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataRef_Sha1 model = DataRef_Sha1();
    DataRef_Sha1.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'DataRef_Sha1()';
  }
}
