import 'package:dio/dio.dart';
import 'package:hijra_steps/screens/Topic/models/topic.dart';
import 'package:retrofit/retrofit.dart';
part 'get_topic.g.dart';

// @TODO separate baseUrl, check trashi how to implement this
@RestApi(baseUrl: "http://192.168.1.16:3000")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/topic/1")
  Future<Topic> getTopic();
}
