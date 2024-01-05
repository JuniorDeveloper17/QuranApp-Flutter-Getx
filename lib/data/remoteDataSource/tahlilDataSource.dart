import 'dart:convert';

import 'package:http/http.dart' as http;

class TahlilDataSource {
  
  Future getTahlil() async {
    Uri url = Uri.parse(
        "https://islamic-api-zhirrr.vercel.app/api/tahlil?ref=https://githubhelp.com");
    var res = await http.get(url);
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data!.isEmpty) {
      return [];
    }
    return data;
  }
}
