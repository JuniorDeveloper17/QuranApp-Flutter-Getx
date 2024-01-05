import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteSholatDataSource {
  Future getLokasi() async {
    Uri url = Uri.parse('https://api.myquran.com/v2/sholat/kota/semua');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future getJadwalSholat(
      {required String idKota, required String dateNow}) async {
    Uri url =
        Uri.parse('https://api.myquran.com/v2/sholat/jadwal/$idKota/$dateNow');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return (json.decode(response.body) as Map<String, dynamic>)['data'];
    } else {
      return null;
    }
  }

  Future getJadwalSholatPerbulan(
      {required String idKota, required String dateNow}) async {
    Uri url =
        Uri.parse('https://api.myquran.com/v2/sholat/jadwal/$idKota/$dateNow');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return (json.decode(response.body) as Map<String, dynamic>)['data'];
    } else {
      return null;
    }
  }
}
