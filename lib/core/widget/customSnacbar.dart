import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

void customSnackbar({required bool isTrue, required String messege}) {
  Get.snackbar('', '',
      titleText: Text(
        isTrue == true ? 'Berhasil' : 'Kesalahan',
        style: TextStyle(
            color: isTrue == true ? blue1 : red,
            fontSize: 17,
            fontWeight: FontWeight.w700),
      ),
      messageText: Text(
        messege,
        style: TextStyle(color: black, fontSize: 14),
      ));
}
