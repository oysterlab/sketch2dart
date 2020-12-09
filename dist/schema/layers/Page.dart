import './AbstractGroup.dart';

class Page extends AbstractGroup {
  final String _class = "page";
  bool includeInCloudUpload;
  Object horizontalRulerData;
  Object verticalRulerData;
  Object layout;
  Object grid;

  Page();

  static setModelWithMap(Map<String, dynamic> map, Page model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.horizontalRulerData = map['horizontalRulerData'];

    model.verticalRulerData = map['verticalRulerData'];

    model.layout = map['layout'];

    model.grid = map['grid'];

	}

  factory Page.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Page model = Page();
	  Page.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Page()';
  }

} 
 