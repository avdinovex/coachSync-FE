import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

/// Custom HTTP client with increased timeout
class TimeoutHttpClient extends http.BaseClient {
  TimeoutHttpClient({this.timeout = const Duration(seconds: 120)})
      : _inner = IOClient(
          HttpClient()
            ..connectionTimeout = timeout
            ..idleTimeout = timeout
            // Allow persistent connections
            // ..maxConnectionsPerHost = 1
            ..autoUncompress = true,
        );

  final Duration timeout;
  final IOClient _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Remove forced connection close to allow keep-alive
    // request.headers['Connection'] = 'close';
    
    try {
      print('🔵 [TimeoutHttpClient] Sending request to ${request.url}');
      final response = await _inner.send(request).timeout(
        timeout,
        onTimeout: () {
          print('🔴 [TimeoutHttpClient] Request timed out after ${timeout.inSeconds} seconds');
          throw TimeoutException(
            'Request timed out after ${timeout.inSeconds} seconds',
            timeout,
          );
        },
      );
      print('🟢 [TimeoutHttpClient] Request completed with status ${response.statusCode}');
      return response;
    } catch (e) {
      print('🔴 [TimeoutHttpClient] Request error: $e');
      rethrow;
    }
  }

  @override
  void close() {
    _inner.close();
  }
}
