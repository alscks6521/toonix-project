import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonix/models/webtoon_detail_model.dart';
import 'package:toonix/models/webtoon_episode_model.dart';
import 'package:toonix/models/webtoon_model.dart';

//웹툰 정보를 가져오기 위한 API 서비스를 제공.
class ApiService {
  // API의 기본 URL
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  // 오늘의 웹툰 정보를 가져오기 위환 엔드포인트
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebttonEpisodeModel>> getLatesEpisodeById(String id) async {
    List<WebttonEpisodeModel> episodeInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeInstances.add(WebttonEpisodeModel.fromJson(episode));
      }
      return episodeInstances;
    }
    throw Error();
  }
}
