class DataIkan {
  final int dissolved;
  final String pakan;
  final double suhu;
  final int tds;
  final double voltage;

  DataIkan({
    this.dissolved,
    this.pakan,
    this.suhu,
    this.tds,
    this.voltage,
  });

  factory DataIkan.fromJson(Map<dynamic, dynamic> json) {
    return DataIkan(
      dissolved: json['do'],
      pakan: json['pakan'],
      suhu: json['suhu'],
      tds: json['tds'],
      voltage: json['voltage'],
    );
  }
}
