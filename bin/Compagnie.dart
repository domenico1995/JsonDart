class Compagnie {
  InsuranceCompanies? _insuranceCompanies;

  Compagnie({InsuranceCompanies? insuranceCompanies}) {
    if (insuranceCompanies != null) {
      this._insuranceCompanies = insuranceCompanies;
    }
  }

  InsuranceCompanies? get insuranceCompanies => _insuranceCompanies;
  set insuranceCompanies(InsuranceCompanies? insuranceCompanies) =>
      _insuranceCompanies = insuranceCompanies;

  Compagnie.fromJson(Map<String, dynamic> json) {
    _insuranceCompanies = json['InsuranceCompanies'] != null
        ? new InsuranceCompanies.fromJson(json['InsuranceCompanies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._insuranceCompanies != null) {
      data['InsuranceCompanies'] = this._insuranceCompanies!.toJson();
    }
    return data;
  }
}

class InsuranceCompanies {
  String? _time;
  List<TopInsuranceCompanies>? _topInsuranceCompanies;
  String? _source;
  String? _url;

  InsuranceCompanies(
      {String? time,
      List<TopInsuranceCompanies>? topInsuranceCompanies,
      String? source,
      String? url}) {
    if (time != null) {
      this._time = time;
    }
    if (topInsuranceCompanies != null) {
      this._topInsuranceCompanies = topInsuranceCompanies;
    }
    if (source != null) {
      this._source = source;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get time => _time;
  set time(String? time) => _time = time;
  List<TopInsuranceCompanies>? get topInsuranceCompanies =>
      _topInsuranceCompanies;
  set topInsuranceCompanies(
          List<TopInsuranceCompanies>? topInsuranceCompanies) =>
      _topInsuranceCompanies = topInsuranceCompanies;
  String? get source => _source;
  set source(String? source) => _source = source;
  String? get url => _url;
  set url(String? url) => _url = url;

  InsuranceCompanies.fromJson(Map<String, dynamic> json) {
    _time = json['Time'];
    if (json['Top Insurance Companies'] != null) {
      _topInsuranceCompanies = <TopInsuranceCompanies>[];
      json['Top Insurance Companies'].forEach((v) {
        _topInsuranceCompanies!.add(new TopInsuranceCompanies.fromJson(v));
      });
    }
    _source = json['source'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Time'] = this._time;
    if (this._topInsuranceCompanies != null) {
      data['Top Insurance Companies'] =
          this._topInsuranceCompanies!.map((v) => v.toJson()).toList();
    }
    data['source'] = this._source;
    data['url'] = this._url;
    return data;
  }
}

class TopInsuranceCompanies {
  String? _no;
  String? _name;
  String? _marketCapitalization;

  TopInsuranceCompanies(
      {String? no, String? name, String? marketCapitalization}) {
    if (no != null) {
      this._no = no;
    }
    if (name != null) {
      this._name = name;
    }
    if (marketCapitalization != null) {
      this._marketCapitalization = marketCapitalization;
    }
  }

  String? get no => _no;
  set no(String? no) => _no = no;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get marketCapitalization => _marketCapitalization;
  set marketCapitalization(String? marketCapitalization) =>
      _marketCapitalization = marketCapitalization;

  TopInsuranceCompanies.fromJson(Map<String, dynamic> json) {
    _no = json['No'];
    _name = json['Name'];
    _marketCapitalization = json['Market Capitalization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['No'] = this._no;
    data['Name'] = this._name;
    data['Market Capitalization'] = this._marketCapitalization;
    return data;
  }
}