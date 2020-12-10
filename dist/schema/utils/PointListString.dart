class PointListString {
    dynamic value;

    PointListString();

    factory PointListString.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      PointListString model = PointListString();
      model.value = map;
      return model;
    }
}
