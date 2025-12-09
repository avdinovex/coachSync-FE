import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

/// Custom HTTP client with increased timeout
class TimeoutHttpClient extends http.BaseClient {
  TimeoutHttpClient({this.timeout = const Duration(seconds: 60)})
      : _inner = IOClient(
          HttpClient()
            ..connectionTimeout = timeout
            ..idleTimeout = timeout,
        );

  final Duration timeout;
  final IOClient _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      return await _inner.send(request).timeout(
        timeout,
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${timeout.inSeconds} seconds',
            timeout,
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  void close() {
    _inner.close();
  }
}
