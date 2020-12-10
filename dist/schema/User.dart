
class User {
  User_Document document;

  User();

  static setModelWithMap(Map<String, dynamic> map, User model) {
    model.document = map['document'];

	}

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User model = User();
	  User.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'User()';
  }

} 
class User_Document {
  int pageListHeight;
  int pageListCollapsed;
  List expandedSymbolPathsInSidebar;
  List expandedTextStylePathsInPopover;
  int libraryListCollapsed;

  User_Document();

  static setModelWithMap(Map<String, dynamic> map, User_Document model) {
    model.pageListHeight = map['pageListHeight'];

    model.pageListCollapsed = map['pageListCollapsed'];

    model.expandedSymbolPathsInSidebar = List.from(map['expandedSymbolPathsInSidebar']);

    model.expandedTextStylePathsInPopover = List.from(map['expandedTextStylePathsInPopover']);

    model.libraryListCollapsed = map['libraryListCollapsed'];

	}

  factory User_Document.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User_Document model = User_Document();
	  User_Document.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'User_Document()';
  }

} 
