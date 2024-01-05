import 'package:get/get.dart';
import 'package:quranapp/data/model/juz_m.dart';
import 'package:quranapp/data/remoteDataSource/quranDataSource.dart';

class JuzController extends GetxController {
  RxBool isLoading = false.obs;

  Future<JuzModel?> getDetailJuz({required String id}) async {
    final response = await QuranRemoteDataSource().getDetailJUz(id: id);
    if (response != null) {
      return JuzModel.fromJson(response);
    } else {
      return null;
    }
  }
}
