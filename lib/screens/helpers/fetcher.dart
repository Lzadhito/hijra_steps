import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Fetcher {
  Future fetch(url) {
    DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions =
        buildCacheOptions(Duration(days: 7), forceRefresh: true);
    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return _dio.get(url, options: _cacheOptions);
  }
}
