import 'package:get/get.dart';
import 'package:quranapp/auth/view/auth.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/home/view/homeView.dart';

class SplashController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    cekStatusAuth();
    super.onInit();
  }

  void cekStatusAuth() async {
    await home.getDataUser();
    Future.delayed(Duration(seconds: 3), () async {
      if (home.dataUser.value.userName == null) {
        Get.offAll(() => AuthView());
      } else {
        Get.offAll(() => HomeView());
      }
    });
  }
}
