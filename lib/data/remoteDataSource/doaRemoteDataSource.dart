import 'dart:convert';

import 'package:http/http.dart' as http;

class DoaRemoteDataSource {
  Future getDoa() async {
    Uri url = Uri.parse(
        "https://islamic-api-zhirrr.vercel.app/api/doaharian?ref=https://githubhelp.com");
    var response = await http.get(url);
    List? data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data!.isEmpty) {
      return [];
    }
    return data;
  }
}
