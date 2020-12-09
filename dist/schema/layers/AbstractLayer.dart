
class AbstractLayer {
  String do_objectID;
  int booleanOperation;
  Object exportOptions;
  Object frame;
  Object flow;
  bool isFixedToViewport;
  bool isFlippedHorizontal;
  bool isFlippedVertical;
  bool isLocked;
  bool isVisible;
  int layerListExpandedType;
  String name;
  bool nameIsFixed;
  int resizingConstraint;
  int resizingType;
  double rotation;
  String sharedStyleID;
  bool shouldBreakMaskChain;
  bool hasClippingMask;
  int clippingMaskMode;
  dynamic userInfo;
  Object style;
  bool maintainScrollPosition;

  AbstractLayer();

  static setModelWithMap(Map<String, dynamic> map, AbstractLayer model) {
    model.do_objectID = map['do_objectID'];

    model.booleanOperation = map['booleanOperation'];

    model.exportOptions = map['exportOptions'];

    model.frame = map['frame'];

    model.flow = map['flow'];

    model.isFixedToViewport = map['isFixedToViewport'];

    model.isFlippedHorizontal = map['isFlippedHorizontal'];

    model.isFlippedVertical = map['isFlippedVertical'];

    model.isLocked = map['isLocked'];

    model.isVisible = map['isVisible'];

    model.layerListExpandedType = map['layerListExpandedType'];

    model.name = map['name'];

    model.nameIsFixed = map['nameIsFixed'];

    model.resizingConstraint = map['resizingConstraint'];

    model.resizingType = map['resizingType'];

    model.rotation = map['rotation'] != null ? map['rotation'].toDouble() : 0.0;

    model.sharedStyleID = map['sharedStyleID'];

    model.shouldBreakMaskChain = map['shouldBreakMaskChain'];

    model.hasClippingMask = map['hasClippingMask'];

    model.clippingMaskMode = map['clippingMaskMode'];

    model.userInfo = map['userInfo'];

    model.style = map['style'];

    model.maintainScrollPosition = map['maintainScrollPosition'];

	}

  factory AbstractLayer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractLayer model = AbstractLayer();
	  AbstractLayer.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractLayer()';
  }

} 
 
class AbstractLayer_UserInfo {

  AbstractLayer_UserInfo();

  static setModelWithMap(Map<String, dynamic> map, AbstractLayer_UserInfo model) {
	}

  factory AbstractLayer_UserInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractLayer_UserInfo model = AbstractLayer_UserInfo();
	  AbstractLayer_UserInfo.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractLayer_UserInfo()';
  }

} 
 