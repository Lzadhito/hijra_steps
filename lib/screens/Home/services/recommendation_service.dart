import 'package:hijra_steps/screens/Home/models/Topic.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class RecommendationService {
  Future<Topic> fetchRecommendation() async {
    try {
      const String url = "http://192.168.1.13:3000/recommendation/1";
      final response = await Fetcher().fetch(url);

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
