class PenempatanModel {
  final int? id;
  final DateTime tanggalPenempatan;
  final int idAyam;
  final int idKandang;
  final String status;

  PenempatanModel({
    this.id,
    required this.tanggalPenempatan,
    required this.idAyam,
    required this.idKandang,
    required this.status,
  });

  Map<String, Object?> toJson() => {
        PenempatanFields.id: id,
        PenempatanFields.tanggalPenempatan: tanggalPenempatan.toIso8601String(),
        PenempatanFields.idAyam: idAyam,
        PenempatanFields.idKandang: idKandang,
        PenempatanFields.status: status,
      };

  static PenempatanModel fromJson(Map<String, Object?> json) => PenempatanModel(
      id: json[PenempatanFields.id] as int?,
      tanggalPenempatan:
          DateTime.parse(json[PenempatanFields.tanggalPenempatan] as String),
      idAyam: json[PenempatanFields.idAyam] as int,
      idKandang: json[PenempatanFields.idKandang] as int,
      status: json[PenempatanFields.status] as String);

  PenempatanModel copy({
    int? id,
    DateTime? tanggalPenempatan,
    int? idAyam,
    int? idKandang,
    String? status,
  }) =>
      PenempatanModel(
        id: id ?? this.id,
        tanggalPenempatan: tanggalPenempatan ?? this.tanggalPenempatan,
        idAyam: idAyam ?? this.idAyam,
        idKandang: idKandang ?? this.idKandang,
        status: status ?? this.status,
      );
}

class PenempatanFields {
  static final List<String> values = [
    id,
    tanggalPenempatan,
    idAyam,
    idKandang,
    status,
  ];

  static final String id = '_id';
  static final String tanggalPenempatan = 'tanggalPenempatan';
  static final String idAyam = 'idAyam';
  static final String idKandang = 'idKandang';
  static final String status = 'status';
}
