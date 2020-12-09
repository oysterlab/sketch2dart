
class OverrideProperty {
  final String _class = "MSImmutableOverrideProperty";
  Object overrideName;
  bool canOverride;

  OverrideProperty();

  static setModelWithMap(Map<String, dynamic> map, OverrideProperty model) {
    model.overrideName = map['overrideName'];

    model.canOverride = map['canOverride'];

	}

  factory OverrideProperty.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OverrideProperty model = OverrideProperty();
	  OverrideProperty.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'OverrideProperty()';
  }

} 
 