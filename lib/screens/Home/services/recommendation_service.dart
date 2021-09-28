import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijra_steps/screens/Home/models/Subject.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class RecommendationService {
  Future<Subject> fetchRecommendation() async {
    try {
      final String url = '${dotenv.get('RECOMMENDATION')}';
      final response = await Fetcher().fetch(url);

      if (response.statusCode == 200) {
        return Subject.fromJson(response.data);
      } else {
        return Future.error('Failed to load recommendation');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
