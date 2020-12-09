class Meta {}

class User {}

class Workspace {}

class AbstractDocument {}

class AbstractLayer {}

class Page {}

class Artboard {}

class Group {}

class FileFormat {
  Meta meta;
  User user;
  Workspace workspace;
  List<dynamic> layers;
}

class ChildClass extends FileFormat {
  double data1;
}
