import 'dart:convert';
import 'package:http/http.dart' as http;

class HadisDataSource {
  Future getPerawi() async {
    Uri url = Uri.parse('https://api.hadith.gading.dev/books');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data;
    } else {
      return [];
    }
  }

  Future getDetailHadis({required String id}) async {
    Uri url = Uri.parse('https://api.hadith.gading.dev/books/$id?range=1-150');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data;
    } else {
      return null;
    }
  }
}
