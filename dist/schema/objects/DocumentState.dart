
class DocumentState {

  DocumentState();

  static setModelWithMap(Map<String, dynamic> map, DocumentState model) {
	}

  factory DocumentState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DocumentState model = DocumentState();
	  DocumentState.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'DocumentState()';
  }

} 
