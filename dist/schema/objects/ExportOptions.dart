import './ExportFormat.dart';

class ExportOptions {
  final String _class = "exportOptions";
  List exportFormats;
  List includedLayerIds;
  int layerOptions;
  bool shouldTrim;

  ExportOptions();

  static setModelWithMap(Map<String, dynamic> map, ExportOptions model) {
    if (map['exportFormats']) {
      model.exportFormats = map['exportFormats'].map((d) => new ExportFormat.fromMap(d));
    }

    model.layerOptions = map['layerOptions'];

    model.shouldTrim = map['shouldTrim'];
  }

  factory ExportOptions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ExportOptions model = ExportOptions();
    ExportOptions.setModelWithMap(map, model);
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'ExportOptions()';
  }
}
