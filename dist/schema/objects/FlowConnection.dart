import '../utils/Uuid.dart';

class FlowConnection {
  final String _class = "MSImmutableFlowConnection";
  dynamic destinationArtboardID;
  int animationType;
  bool maintainScrollPosition;

  FlowConnection();

  static setModelWithMap(Map<String, dynamic> map, FlowConnection model) {
    dynamic destinationArtboardID_t = map['destinationArtboardID'];
    if (destinationArtboardID_t) {
      switch(destinationArtboardID_t['_class']) {
        default:
          break;
      }
    }

    model.animationType = map['animationType'];

    model.maintainScrollPosition = map['maintainScrollPosition'];

	}

  factory FlowConnection.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FlowConnection model = FlowConnection();
	  FlowConnection.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FlowConnection()';
  }

} 
 