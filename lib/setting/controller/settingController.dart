import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customSnacbar.dart';
import '../widget/widgetBottomSheet.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  @override
  void dispose() {
    messege.dispose();
    super.dispose();
  }

  TextEditingController messege = TextEditingController();

  void openSnackbar({required String title}) async {
    auth.username.text = '${home.dataUser.value.userName}';
    Get.bottomSheet(WidgetBottomSheet(title: title));
  }

  void sendMessege() async {
    if (messege.text == '') {
      customSnackbar(
          messege: 'tuliskan saran anda terlebih dahulu', isTrue: false);
    } else {
      try {
        var whatsappUrl = Uri.parse(
            "https://whatsapp://send?phone=${085369530868}" +
                "&text=${Uri.encodeComponent("${messege.text}")}");
        launchUrl(whatsappUrl);
      } catch (e) {}
    }
  }
}
