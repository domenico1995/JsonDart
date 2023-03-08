class Museo {
  String? _item;
  String? _name;
  String? _lat;
  String? _lon;

  Museo({String? item, String? name, String? lat, String? lon}) {
    if (item != null) {
      this._item = item;
    }
    if (name != null) {
      this._name = name;
    }
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
  }

  String? get item => _item;
  set item(String? item) => _item = item;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get lat => _lat;
  set lat(String? lat) => _lat = lat;
  String? get lon => _lon;
  set lon(String? lon) => _lon = lon;

  Museo.fromJson(Map<String, dynamic> json) {
    _item = json['item'];
    _name = json['name'];
    _lat = json['lat'];
    _lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this._item;
    data['name'] = this._name;
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    return data;
  }

  @override
  String toString() {
    return "${this._item} ${this._name} ${this._lat} ${this._lon}";
  }
}
