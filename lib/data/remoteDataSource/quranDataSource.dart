import 'dart:convert';

import 'package:http/http.dart' as http;

class QuranRemoteDataSource {
  Future getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data;
    } else {
      return [];
    }
  }

  Future getDetailSurah({required String id}) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data;
    } else {
      return null;
    }
  }

  Future getDetailJUz({required String id}) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/juz/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data;
    } else {
      return null;
    }
  }
}
