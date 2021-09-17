import 'package:hijra_steps/screens/Home/models/Profile.dart';
import 'package:hijra_steps/screens/helpers/fetcher.dart';

class ProfileService {
  Future<Profile> fetchProfile() async {
    try {
      const String url = "http://192.168.1.13:3000/profile";
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
