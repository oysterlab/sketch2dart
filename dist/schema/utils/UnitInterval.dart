class UnitInterval {
    dynamic value;

    UnitInterval();

    factory UnitInterval.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      UnitInterval model = UnitInterval();
      model.value = map;
      return model;
    }
}
