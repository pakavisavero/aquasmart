class DataIkan {
  final dynamic dissolved, daya, suhu, tds, voltage;
  DataIkan({
    this.dissolved,
    this.daya,
    this.suhu,
    this.tds,
    this.voltage,
  });

  factory DataIkan.fromJson(Map<dynamic, dynamic> json) {
    return DataIkan(
      dissolved: json['do'],
      daya: json['isPLTS'],
      suhu: json['suhu'],
      tds: json['tds'],
      voltage: json['voltage'],
    );
  }
}
