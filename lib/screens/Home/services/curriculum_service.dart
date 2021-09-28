import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijra_steps/screens/Home/models/Level.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class CurriculumService {
  Future<List<Level>> fetchCurriculum() async {
    try {
      final String url = '${dotenv.get('CURRICULUM')}';
      print(url);
      final response = await Fetcher().fetch(url);

      if (response.statusCode == 200) {
        final jsonData = response.data;
        List<Level> result = [];
        for (var i in jsonData) {
          Level curriculum = Level.fromJson(i);
          result.add(curriculum);
        }
        return result;
      } else {
        return Future.error('Failed to load recommendation');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
