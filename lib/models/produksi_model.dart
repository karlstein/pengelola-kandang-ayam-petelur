class ProduksiModel {
  final int? id;
  final int produksi;
  final DateTime waktuPengumpulan;
  final int idPenempatan;
  final bool telurKecil;
  final bool telurPutihTipis;
  final bool telurBerbintik;
  final String? keterangan;

  ProduksiModel({
    this.id,
    required this.produksi,
    required this.waktuPengumpulan,
    required this.idPenempatan,
    required this.telurKecil,
    required this.telurPutihTipis,
    required this.telurBerbintik,
    required this.keterangan,
  });

  Map<String, Object?> toJson() => {
        ProduksiFields.id: id,
        ProduksiFields.produksi: produksi,
        ProduksiFields.waktuPengumpulan: waktuPengumpulan.toIso8601String(),
        ProduksiFields.idPenempatan: idPenempatan,
        ProduksiFields.telurKecil: telurKecil ? 1 : 0,
        ProduksiFields.telurPutihTipis: telurPutihTipis ? 1 : 0,
        ProduksiFields.telurBerbintik: telurBerbintik ? 1 : 0,
        ProduksiFields.keterangan: keterangan!,
      };

  static ProduksiModel fromJson(Map<String, Object?> json) => ProduksiModel(
      id: json[ProduksiFields.id] as int?,
      produksi: json[ProduksiFields.produksi] as int,
      waktuPengumpulan:
          DateTime.parse(json[ProduksiFields.waktuPengumpulan] as String),
      idPenempatan: json[ProduksiFields.idPenempatan] as int,
      telurKecil: json[ProduksiFields.telurKecil] == 1,
      telurPutihTipis: json[ProduksiFields.telurPutihTipis] == 1,
      telurBerbintik: json[ProduksiFields.telurBerbintik] == 1,
      keterangan: json[ProduksiFields.keterangan] as String);

  ProduksiModel copy({
    int? id,
    int? produksi,
    DateTime? waktuPengumpulan,
    int? idPenempatan,
    bool? telurKecil,
    bool? telurPutihTipis,
    bool? telurBerbintik,
    String? keterangan,
  }) =>
      ProduksiModel(
        id: id ?? this.id,
        produksi: produksi ?? this.produksi,
        waktuPengumpulan: waktuPengumpulan ?? this.waktuPengumpulan,
        idPenempatan: idPenempatan ?? this.idPenempatan,
        telurKecil: telurKecil ?? this.telurKecil,
        telurPutihTipis: telurPutihTipis ?? this.telurPutihTipis,
        telurBerbintik: telurBerbintik ?? this.telurBerbintik,
        keterangan: keterangan ?? this.keterangan,
      );
}

class ProduksiFields {
  static final List<String> values = [
    id,
    produksi,
    waktuPengumpulan,
    idPenempatan,
    telurKecil,
    telurPutihTipis,
    telurBerbintik,
    keterangan,
  ];

  static final String id = '_id';
  static final String produksi = 'produksi';
  static final String waktuPengumpulan = 'waktuPengumpulan';
  static final String idPenempatan = 'idPenempatan';
  static final String telurKecil = 'telurKecil';
  static final String telurPutihTipis = 'telurPutihTipis';
  static final String telurBerbintik = 'telurBerbintik';
  static final String keterangan = 'keterangan';
}
