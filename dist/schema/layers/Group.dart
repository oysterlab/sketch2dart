import './AbstractGroup.dart';

class Group extends AbstractGroup {
  final String _class = "group";

  Group();

  static setModelWithMap(Map<String, dynamic> map, Group model) {
    AbstractGroup.setModelWithMap(map, model);

	}

  factory Group.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Group model = Group();
	  Group.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Group()';
  }

} 
 