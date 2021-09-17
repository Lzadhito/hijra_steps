import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:hijra_steps/screens/Home/models/Topic.dart';

class RecommendationService {
  Future<Topic> fetchRecommendation() async {
    DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions =
        buildCacheOptions(Duration(days: 7), forceRefresh: true);
    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);

    try {
      const String url = "http://192.168.1.13:3000/recommendation/1";
      final response = await _dio.get(url, options: _cacheOptions);

      if (response.statusCode == 200) {
        return Topic.fromJson(response.data);
      } else {
        return Future.error('Failed to load recommendation');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
