import 'package:intl/intl.dart';
import 'package:quranapp/data/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userLocalDataSource {
  Future getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = await UserModel(
        userName: pref.getString('username'),
        locationName: pref.getString('locationName'),
        idLocation: pref.getString('idLocation'),
        date: DateFormat('yyyy/MM/dd').format(DateTime.now()),
        historis: Historis(
            arti: pref.getString('arti'),
            ayah: pref.getString('ayah'),
            lastRead: pref.getString('lastRead')));
    return data;
  }

  Future saveUserData({required String key, required String value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (key == 'lastRead') {
      List text = value.split(' | ');
      await pref.setString(key, text[0]);
      await pref.setString('ayah', text[1]);
      await pref.setString('arti', text[2]);
    } else {
      pref.setString(key, value);
    }
    return key;
  }
}
