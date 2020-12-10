import './OverrideName.dart';
import '../utils/Uuid.dart';
import './FileRef.dart';
import './DataRef.dart';

class OverrideValue {
  final String _class = "overrideValue";
  String do_objectID;
  OverrideName overrideName;
  dynamic value;

  OverrideValue();

  static setModelWithMap(Map<String, dynamic> map, OverrideValue model) {
    model.do_objectID = map['do_objectID'];

    model.overrideName = map['overrideName'] != null ? new OverrideName.fromMap(map['overrideName']) : null;

    dynamic value_t = map['value'];
    if (value_t != null) {
      switch(value_t['_class']) {
        case 'MSJSONFileReference':
          model.value = map['value'] != null ? new FileRef.fromMap(map['value']) : null;
          break;

        case 'MSJSONOriginalDataReference':
          model.value = map['value'] != null ? new DataRef.fromMap(map['value']) : null;
          break;

        default:
          break;
      }
    }

	}

  factory OverrideValue.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OverrideValue model = OverrideValue();
	  OverrideValue.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'OverrideValue()';
  }

} 
