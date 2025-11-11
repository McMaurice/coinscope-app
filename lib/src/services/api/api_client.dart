import 'package:http/http.dart' as http;
import 'api_constants.dart';

//--- HANDLES THE CONNECTION TO THE INTERNET -----
class ApiClient {
  ApiClient({Map<String, String>? defaultHeaders})
    : defaultHeaders = defaultHeaders ?? ApiConstants.apiHeaders;

  final String baseUrl = ApiConstants.baseUrl;
  final Map<String, String> defaultHeaders;

  //---- GET REQUEST ----
  Future<String> get(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    final mergedQuery = {...ApiConstants.defaultQueryParams, ...?queryParams};

    final uri = Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: mergedQuery);

    final response = await http
        .get(uri, headers: {...defaultHeaders})
        .timeout(const Duration(seconds: 15));

    //print('GET ${uri.toString()} → ${response.statusCode}');
    return _processResponse(response);
  }

  //---- POST REQUEST ----
  Future<String> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');

    final response = await http
        .post(
          uri,
          headers: {
            ...defaultHeaders,
            ...?headers,
            'Content-Type': 'application/json',
          },
          body: body,
        )
        .timeout(const Duration(seconds: 15));

    // print('POST ${uri.toString()} → ${response.statusCode}');
    return _processResponse(response);
  }

  //---- PROCESS API RESPONSE ----
  String _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      return responseBody;
    } else {
      throw ApiException(statusCode, responseBody);
    }
  }
}

//---- API EXCEPTION CLASS ----
class ApiException implements Exception {
  final int statusCode;
  final dynamic body;

  ApiException(this.statusCode, this.body);

  @override
  String toString() => 'ApiException ($statusCode): $body';
}
