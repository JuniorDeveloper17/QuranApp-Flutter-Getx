import 'package:get/get.dart';
import 'package:quranapp/data/model/doa_m.dart';
import 'package:quranapp/data/remoteDataSource/doaRemoteDataSource.dart';

class DoaController extends GetxController {

  Future<List<DoaHarian?>> getDoa() async {
    final response = await DoaRemoteDataSource().getDoa();
    if (response != null) {
      List data = List.from(response);
      return data.map((e) => DoaHarian.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
