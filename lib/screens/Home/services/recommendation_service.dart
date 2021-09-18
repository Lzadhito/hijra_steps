import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijra_steps/screens/Home/models/Topic.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class RecommendationService {
  Future<Topic> fetchRecommendation() async {
    try {
      final String url = '${dotenv.get('DOMAIN')}/recommendation/1';
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
