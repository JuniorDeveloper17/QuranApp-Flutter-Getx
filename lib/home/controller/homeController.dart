import 'package:get/get.dart';
import 'package:quranapp/core/widget/customSnacbar.dart';
import 'package:quranapp/data/localDataSource/userDataSource.dart';
import 'package:quranapp/data/model/userModel.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<UserModel> dataUser = UserModel().obs;
  Future getDataUser() async {
    final data = await userLocalDataSource().getDataUser();
    if (data != '') {
      dataUser(data);
    } else {
      getDataUser();
    }
  }

  Future updateUserData({required String key, required String value}) async {
    final response =
        await userLocalDataSource().saveUserData(key: key, value: value);
    if (response != null) {
      await getDataUser();
      customSnackbar(isTrue: true, messege: 'Berhasil Menyimpan Histori $value');
    } else {
      customSnackbar(
          isTrue: false,
          messege: 'Ups, sepertinya terjadi kesalahan, silahkan coba kembali');
    }
  }
}
