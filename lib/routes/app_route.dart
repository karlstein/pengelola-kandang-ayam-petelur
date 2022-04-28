import 'package:get/get.dart';
import 'package:pengelola_kandang_ayam_petelur/routes/routes_name.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/dashboard/dashboard.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/data_ayam/data_ayam.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/data_kandang/data_kandang.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/data_penempatan/data_penempatan.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/data_produksi/data_produksi.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/produksi_bulanan/produksi_bulanan.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/produksi_harian/produksi_harian.dart';
import 'package:pengelola_kandang_ayam_petelur/ui/produksi_tahunan/produksi_tahunan.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: RoutesName.dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: RoutesName.dataProduksi,
      page: () => DataProduksi(),
    ),
    GetPage(
      name: RoutesName.dataKandang,
      page: () => DataKandang(),
    ),
    GetPage(
      name: RoutesName.dataAyam,
      page: () => DataAyam(),
    ),
    GetPage(
      name: RoutesName.dataPenempatan,
      page: () => DataPenempatan(),
    ),
    GetPage(
      name: RoutesName.produksiHarian,
      page: () => ProduksiHarian(),
    ),
    GetPage(
      name: RoutesName.produksiBulanan,
      page: () => ProduksiBulanan(),
    ),
    GetPage(
      name: RoutesName.produksiTahunan,
      page: () => ProduksiTahunan(),
    ),
  ];
}
