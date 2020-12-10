class PointString {
    dynamic value;

    PointString();

    factory PointString.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      PointString model = PointString();
      model.value = map;
      return model;
    }
}
