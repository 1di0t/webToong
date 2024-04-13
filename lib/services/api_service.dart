import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:webtoong/models/webtoon_detail_model.dart';
import 'package:webtoong/models/webtoon_episode.dart';
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

  static Future<WebtoonDetailModel> getWebtoonById(String id) async {
    final url = Uri.parse('$baseUrl$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error;
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstance = [];
    final url = Uri.parse('$baseUrl$id/epsiodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstance.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstance;
    }
    throw Error;
  }
}
