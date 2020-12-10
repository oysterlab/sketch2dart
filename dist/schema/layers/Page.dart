import './AbstractGroup.dart';
import '../objects/RulerData.dart';
import '../objects/RulerData.dart';
import '../objects/LayoutGrid.dart';
import '../objects/SimpleGrid.dart';

class Page extends AbstractGroup {
  final String _class = "page";
  bool includeInCloudUpload;
  RulerData horizontalRulerData;
  RulerData verticalRulerData;
  LayoutGrid layout;
  SimpleGrid grid;

  Page();

  static setModelWithMap(Map<String, dynamic> map, Page model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.horizontalRulerData = map['horizontalRulerData'] != null ? new RulerData.fromMap(map['horizontalRulerData']) : null;

    model.verticalRulerData = map['verticalRulerData'] != null ? new RulerData.fromMap(map['verticalRulerData']) : null;

    model.layout = map['layout'] != null ? new LayoutGrid.fromMap(map['layout']) : null;

    model.grid = map['grid'] != null ? new SimpleGrid.fromMap(map['grid']) : null;

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
