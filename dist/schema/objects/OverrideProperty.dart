import './OverrideName.dart';

class OverrideProperty {
  final String _class = "MSImmutableOverrideProperty";
  OverrideName overrideName;
  bool canOverride;

  OverrideProperty();

  static setModelWithMap(Map<String, dynamic> map, OverrideProperty model) {
    model.overrideName = map['overrideName'] != null ? new OverrideName.fromMap(map['overrideName']) : null;

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
