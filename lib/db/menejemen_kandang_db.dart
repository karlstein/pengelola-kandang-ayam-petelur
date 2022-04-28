import 'package:path/path.dart';
import 'package:pengelola_kandang_ayam_petelur/models/ayam_model.dart';
import 'package:pengelola_kandang_ayam_petelur/models/kandang_model.dart';
import 'package:pengelola_kandang_ayam_petelur/models/penempatan_model.dart';
import 'package:pengelola_kandang_ayam_petelur/models/produksi_model.dart';
import 'package:sqflite/sqflite.dart';

class MenejemenKandangDatabase {
  static final MenejemenKandangDatabase instance =
      MenejemenKandangDatabase._init();
  static Database? _database;

  MenejemenKandangDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('menejemen_kandang.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE tabel_ayam (
        ${AyamFields.id} $idType,
        ${AyamFields.ras} $textType,
        ${AyamFields.waktuKedatangan} $textType,
        ${AyamFields.umurKedatangan} $integerType,
        ${AyamFields.status} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE tabel_kandang (
        ${KandangFields.id} $idType,
        ${KandangFields.kode} $textType,
        ${KandangFields.status} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE tabel_penempatan (
        ${PenempatanFields.id} $idType,
        ${PenempatanFields.tanggalPenempatan} $textType,
        ${PenempatanFields.idAyam} $integerType,
        ${PenempatanFields.idKandang} $integerType,
        ${PenempatanFields.status} $textType,
        FOREIGN KEY (${PenempatanFields.idAyam}) REFERENCES tabel_ayam (${AyamFields.id}),
        FOREIGN KEY (${PenempatanFields.idKandang}) REFERENCES tabel_kandang (${KandangFields.id})
      )
    ''');

    await db.execute('''
      CREATE TABLE tabel_produksi (
        ${ProduksiFields.id} $idType,
        ${ProduksiFields.produksi} $integerType,
        ${ProduksiFields.waktuPengumpulan} $textType,
        ${ProduksiFields.idPenempatan} $integerType,
        ${ProduksiFields.telurKecil} $boolType,
        ${ProduksiFields.telurPutihTipis} $boolType,
        ${ProduksiFields.telurBerbintik} $boolType,
        ${ProduksiFields.keterangan} $textType,
        FOREIGN KEY (${ProduksiFields.idPenempatan}) REFERENCES tabel_penempatan (${PenempatanFields.id})
      )
    ''');
  }

  Future create(String table, Map<String, Object> values) async {
    final db = await instance.database;

    return await db.insert(table, values);
  }

  Future<List<AyamModel>> readAllAyam() async {
    final db = await instance.database;
    final orderBy = '${AyamFields.waktuKedatangan} ASC';
    final maps = await db.query('tabel_ayam', orderBy: orderBy);

    try {
      return maps.map((e) => AyamModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Ayam belum ada');
    }
  }

  Future<List<KandangModel>> readAllKandang() async {
    final db = await instance.database;
    final orderBy = '${KandangFields.kode} ASC';
    final maps = await db.query('tabel_kandang', orderBy: orderBy);

    try {
      return maps.map((e) => KandangModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Kandang belum ada');
    }
  }

  Future<List<PenempatanModel>> readAllPenempatan() async {
    final db = await instance.database;
    final orderBy = '${PenempatanFields.tanggalPenempatan} ASC';
    final maps = await db.rawQuery(
        'SELECT * FROM tabel_ayam, tabel_kandang, tabel_penempatan ORDER BY $orderBy');

    try {
      return maps.map((e) => PenempatanModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Belum ada penempatan');
    }
  }

  Future<List<ProduksiModel>> readAllProduksi() async {
    final db = await instance.database;
    final orderBy = '${ProduksiFields.waktuPengumpulan} ASC';
    final maps = await db.rawQuery(
        'SELECT * FROM tabel_penempatan, tabel_produksi ORDER BY $orderBy');

    try {
      return maps.map((e) => ProduksiModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Belum ada produksi');
    }
  }

  Future<ProduksiModel> readProduksi(int id) async {
    final db = await instance.database;
    final maps = await db.rawQuery(
        'SELECT FROM tabel_penempatan, tabel_produksi WHERE ${ProduksiFields.id} = $id');

    if (maps.isNotEmpty) {
      return ProduksiModel.fromJson(maps.first);
    } else {
      throw extension('ID $id not found');
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
