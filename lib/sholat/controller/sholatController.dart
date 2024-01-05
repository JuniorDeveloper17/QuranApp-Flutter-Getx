import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/data/model/jadwal_sholat_m.dart';
import 'package:quranapp/data/remoteDataSource/jadwalSholatDataSource.dart';
import 'package:screenshot/screenshot.dart';

import '../../core/theme/theme.dart';

class SholatController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool all = false.obs;

  List icon_waktu_sholat = [
    Image.asset(
      'assets/image/sunrise.png',
      height: 20,
      color: white,
    ),
    Image.asset(
      'assets/image/affternoon.png',
      height: 20,
      color: white,
    ),
    Image.asset(
      'assets/image/afternoon.png',
      height: 20,
      color: white,
    ),
    Image.asset(
      'assets/image/night.png',
      height: 20,
      color: white,
    ),
    Image.asset(
      'assets/image/half-moon.png',
      height: 20,
      color: white,
    )
  ];

  Stream<DateTime> clock_now() {
    return Stream.periodic(Duration(seconds: 1), (count) {
      return DateTime.now();
    });
  }

  RxString twodigits(int n) => n.toString().padLeft(2, '0').obs;

  Future<JadwalSholatModel?> getJadwalSholat() async {
    final response = await RemoteSholatDataSource().getJadwalSholat(
        idKota: home.dataUser.value.idLocation!,
        dateNow: home.dataUser.value.date!);
    if (response != null) {
      return JadwalSholatModel.fromJson(response);
    } else {
      return null;
    }
  }

  Future getJadwalSholatPerbulan() async {
    int indeksSlashTerakhir = home.dataUser.value.date!.lastIndexOf('/');
    String tanggalTanpaSatu =
        home.dataUser.value.date!.substring(0, indeksSlashTerakhir + 1);
    print(tanggalTanpaSatu);
  }

  List jadwalSholatPerhari = [].obs;
  List allJadwalSholat = [].obs;

  void addAllJadwalSholat(Jadwal jadwal) {
    jadwalSholatPerhari.addAll([
      jadwal.subuh,
      jadwal.dzuhur,
      jadwal.ashar,
      jadwal.maghrib,
      jadwal.isya
    ]);
    allJadwalSholat.addAll([
      jadwal.imsak,
      jadwal.subuh,
      jadwal.terbit,
      jadwal.dhuha,
      jadwal.dzuhur,
      jadwal.ashar,
      jadwal.maghrib,
      jadwal.isya
    ]);
  }

  List keyJadwal = [
    "imsak",
    "subuh",
    "terbit",
    "dhuha",
    "dzuhur",
    "ashar",
    "maghrib",
    "isya"
  ];

  Future share({required ScreenshotController controller}) async {
    isLoading(true);
    controller.capture().then((value) async {
      await Share.file('esys image', 'esys.png', value!, 'image/png',
          text: 'jadwal sholat ${home.dataUser.value.date}.');
    });
  }

  //

  bool hasPermissions = false;
  CompassEvent? lastRead;
  DateTime? lastReadAt;
}
