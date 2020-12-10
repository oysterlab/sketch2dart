import './SharedStyle.dart';

class SharedTextStyleContainer {
  String do_objectID;
  final String _class = "sharedTextStyleContainer";
  List objects;

  SharedTextStyleContainer();

  static setModelWithMap(Map<String, dynamic> map, SharedTextStyleContainer model) {
    model.do_objectID = map['do_objectID'];

    if (map['objects'] != null) {
       model.objects = map['objects'].map((d) => new SharedStyle.fromMap(d)).toList();
    }

	}

  factory SharedTextStyleContainer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SharedTextStyleContainer model = SharedTextStyleContainer();
	  SharedTextStyleContainer.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SharedTextStyleContainer()';
  }

} 
