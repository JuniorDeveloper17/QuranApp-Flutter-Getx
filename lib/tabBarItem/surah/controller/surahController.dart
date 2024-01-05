import 'package:get/get.dart';
import 'package:quranapp/data/model/quran_m.dart';
import 'package:quranapp/data/model/surah_m.dart';
import 'package:quranapp/data/remoteDataSource/quranDataSource.dart';

class SurahController extends GetxController {
  RxBool isLoading = false.obs;

  Future<List<SurahModel>> getAllSurah() async {
    final response = await QuranRemoteDataSource().getAllSurah();
    if (response != null) {
      List data = List.from(response);
      return data.map((e) => SurahModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<DetailModel?> getDetailSurah({required String id}) async {
    final response = await QuranRemoteDataSource().getDetailSurah(id: id);
    if (response != null) {
      return DetailModel.fromJson(response);
    } else {
      return null;
    }
  }
}
