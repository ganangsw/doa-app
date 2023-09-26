class ResponseDataDoa {
  ResponseDataDoa({
    this.id,
    this.doa,
    this.ayat,
    this.latin,
    this.artinya,
  });

  ResponseDataDoa.fromJson(dynamic json) {
    id = json['id'];
    doa = json['doa'];
    ayat = json['ayat'];
    latin = json['latin'];
    artinya = json['artinya'];
  }

  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doa'] = doa;
    map['ayat'] = ayat;
    map['latin'] = latin;
    map['artinya'] = artinya;
    return map;
  }
}
