
class ImageCollection {
  final String _class = "imageCollection";
  dynamic images;

  ImageCollection();

  static setModelWithMap(Map<String, dynamic> map, ImageCollection model) {
    model.images = map['images'];

	}

  factory ImageCollection.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ImageCollection model = ImageCollection();
	  ImageCollection.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ImageCollection()';
  }

} 
 
class ImageCollection_Images {

  ImageCollection_Images();

  static setModelWithMap(Map<String, dynamic> map, ImageCollection_Images model) {
	}

  factory ImageCollection_Images.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ImageCollection_Images model = ImageCollection_Images();
	  ImageCollection_Images.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ImageCollection_Images()';
  }

} 
 