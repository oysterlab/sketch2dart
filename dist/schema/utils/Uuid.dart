class Uuid {
    dynamic value;

    Uuid();

    factory Uuid.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      Uuid model = Uuid();
      model.value = map;
      return model;
    }
}
