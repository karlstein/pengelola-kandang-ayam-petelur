class KandangModel {
  final int? id;
  final String kode;
  final String status;

  KandangModel({
    this.id,
    required this.kode,
    required this.status,
  });

  Map<String, Object?> toJson() => {
        KandangFields.id: id,
        KandangFields.kode: kode,
        KandangFields.status: status,
      };

  static KandangModel fromJson(Map<String, Object?> json) => KandangModel(
      id: json[KandangFields.id] as int?,
      kode: json[KandangFields.kode] as String,
      status: json[KandangFields.status] as String);

  KandangModel copy({
    int? id,
    String? kode,
    String? status,
  }) =>
      KandangModel(
        id: id ?? this.id,
        kode: kode ?? this.kode,
        status: status ?? this.status,
      );
}

class KandangFields {
  static final List<String> values = [
    id,
    kode,
    status,
  ];

  static final String id = '_id';
  static final String kode = 'kode';
  static final String status = 'status';
}
