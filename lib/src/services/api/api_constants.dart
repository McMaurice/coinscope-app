import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  static final Map<String, String> apiHeaders = {
    'x_cg_demo_api_key': dotenv.env['API_KEY'] ?? '',
  };

  //--- QUERRIES -------
  static const Map<String, String> defaultQueryParams = {'vs_currency': 'usd'};

  //--- ENDPOINTS ----
  static const String marketListEndpoint = '/coins/markets';

  static String ohlcEndpoint(String id) {
    return '/coins/$id/ohlc';
  }
}
