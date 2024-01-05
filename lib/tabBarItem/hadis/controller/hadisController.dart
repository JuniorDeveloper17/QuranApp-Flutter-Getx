import 'package:get/get.dart';
import 'package:quranapp/data/model/detail_hadis_model.dart';
import 'package:quranapp/data/model/periwayah_model.dart';
import 'package:quranapp/data/remoteDataSource/hadisDataSource.dart';

class HadisController extends GetxController {
  RxBool isLoading = false.obs;

  Future<List<PeriwayahModel?>> getPerawiHadis() async {
    final response = await HadisDataSource().getPerawi();
    if (response != null) {
      List data = List.from(response);
      return data.map((e) => PeriwayahModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<DetailHadisModel?> getDetailHadis({required String id}) async {
    final response = await HadisDataSource().getDetailHadis(id: id);
    if (response != null) {
      return DetailHadisModel.fromJson(response);
    } else {
      return null;
    }
  }
}
