import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  static final String apiUrl = dotenv.env['API_URL']!;
}
