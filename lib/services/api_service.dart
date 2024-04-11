import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoong/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev/';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayWebtoons() async {
    List<WebtoonModel> webtoonInstance = [];
    final url = Uri.parse('$baseUrl$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoonList = jsonDecode(response.body);
      for (var webtoon in webtoonList) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon)); //Best Pratices
      }
      return webtoonInstance;
    }
    throw Error();
  }
}
