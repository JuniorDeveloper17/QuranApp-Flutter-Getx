import 'package:get/get.dart';
import 'package:quranapp/data/model/tahlil_m.dart';
import 'package:quranapp/data/remoteDataSource/tahlilDataSource.dart';

class TahlilController extends GetxController {
  Future<List<TahlilModel?>> getTahlil() async {
    final response = await TahlilDataSource().getTahlil();
    if (response != null) {
      List data = List.from(response);
      return data.map((e) => TahlilModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
