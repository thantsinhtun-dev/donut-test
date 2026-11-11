import 'package:http/http.dart' as http;

class HomeRemoteDatasource {
  HomeRemoteDatasource({http.Client? client})
    : _client = client ?? http.Client();

  static const _endpoint = String.fromEnvironment('HOME_CONTENT_URL');
  final http.Client _client;

  Future<String?> fetchHomeContent() async {
    if (_endpoint.isEmpty) return null;

    final response = await _client
        .get(Uri.parse(_endpoint))
        .timeout(const Duration(seconds: 12));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Home refresh failed with HTTP ${response.statusCode}.',
      );
    }
    return response.body;
  }
}
