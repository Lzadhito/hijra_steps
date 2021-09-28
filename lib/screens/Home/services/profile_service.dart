import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijra_steps/screens/Home/models/Profile.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class ProfileService {
  Future<Profile> fetchProfile() async {
    try {
      final String url = '${dotenv.get('PROFILE')}';
      final response = await Fetcher().fetch(url);

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      } else {
        return Future.error('Failed to load recommendation');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
