import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get fileName => ".env";
  static String get apiKey => dotenv.env["API_KEY"] ?? "API_KEY not found";
  static String get baseUrl => dotenv.env["BASE_URI"] ?? "BASE_URI not found";
}
