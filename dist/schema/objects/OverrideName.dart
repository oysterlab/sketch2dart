class OverrideName {
    dynamic value;

    OverrideName();

    factory OverrideName.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      OverrideName model = OverrideName();
      model.value = map;
      return model;
    }
}
