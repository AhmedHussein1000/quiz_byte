import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String baseUrl = 'https://quizapi.io/api/v1';
  static const int limit = 10;
  //end points
  static const String categoriesEndPoint = '/categories';
  static const String questionsEndPoint = '/questions';
  //query params
  static const String apiKeyQueryParameter = 'apiKey';
  static const String limitQueryParameter = 'limit';
  static const String categoryQueryParameter = 'category';
  static const String difficultyQueryParameter = 'difficulty';
  

}
