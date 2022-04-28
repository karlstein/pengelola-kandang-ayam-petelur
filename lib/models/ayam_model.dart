class AyamModel {
  final int? id;
  final String ras;
  final DateTime waktuKedatangan;
  final int umurKedatangan;
  final String status;

  AyamModel({
    this.id,
    required this.ras,
    required this.waktuKedatangan,
    required this.umurKedatangan,
    required this.status,
  });

  Map<String, Object?> toJson() => {
        AyamFields.id: id,
        AyamFields.ras: ras,
        AyamFields.waktuKedatangan: waktuKedatangan.toIso8601String(),
        AyamFields.umurKedatangan: umurKedatangan,
        AyamFields.status: status,
      };

  static AyamModel fromJson(Map<String, Object?> json) => AyamModel(
      id: json[AyamFields.id] as int?,
      ras: json[AyamFields.ras] as String,
      waktuKedatangan:
          DateTime.parse(json[AyamFields.waktuKedatangan] as String),
      umurKedatangan: json[AyamFields.umurKedatangan] as int,
      status: json[AyamFields.status] as String);

  AyamModel copy({
    int? id,
    String? ras,
    DateTime? waktuKedatangan,
    int? umurKedatangan,
    String? status,
  }) =>
      AyamModel(
          id: id ?? this.id,
          ras: ras ?? this.ras,
          waktuKedatangan: waktuKedatangan ?? this.waktuKedatangan,
          umurKedatangan: umurKedatangan ?? this.umurKedatangan,
          status: status ?? this.status);
}

class AyamFields {
  static final List<String> values = [
    id,
    ras,
    waktuKedatangan,
    umurKedatangan,
    status,
  ];

  static final String id = '_id';
  static final String ras = 'ras';
  static final String waktuKedatangan = 'waktuKedatangan';
  static final String umurKedatangan = 'umurKedatangan';
  static final String status = 'status';
}
