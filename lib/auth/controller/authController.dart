import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customSnacbar.dart';
import 'package:quranapp/data/localDataSource/userDataSource.dart';
import 'package:quranapp/data/model/location_m.dart';
import 'package:quranapp/data/remoteDataSource/jadwalSholatDataSource.dart';
import 'package:quranapp/home/view/homeView.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController username = TextEditingController();
  RxString locationName = ''.obs;
  RxString idLocation = ''.obs;

  void SaveData() async {
    if (username.text != '' && locationName.value != '') {
      userLocalDataSource().saveUserData(key: 'username', value: username.text);
      userLocalDataSource()
          .saveUserData(key: 'locationName', value: locationName.value);
      userLocalDataSource()
          .saveUserData(key: 'idLocation', value: idLocation.value);
      await home.getDataUser();
      Get.offAll(() => HomeView());
    } else {
      customSnackbar(
          isTrue: false,
          messege:
              'Ups. data anda belum lengkap, silahkan lengkapi semua form yang ada');
    }
  }

  Future<List<LocationModel?>> getDataLocation() async {
    final response = await RemoteSholatDataSource().getLokasi();
    if (response != '') {
      List data = (json.decode(response) as Map<String, dynamic>)['data'];
      return data.map((e) => LocationModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  void dispose() {
    username.dispose();
    super.dispose();
  }
}
