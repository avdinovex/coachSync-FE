import 'dart:io';
import 'package:http/http.dart' as http;

/// Network diagnostics utility to help debug connection issues
class NetworkDiagnostics {
  /// Test if the backend is reachable
  static Future<bool> testBackendConnection(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http
          .get(Uri.parse('${uri.scheme}://${uri.host}:${uri.port}/'))
          .timeout(const Duration(seconds: 5));
      return response.statusCode < 500;
    } on SocketException {
      return false;
    } on HttpException {
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Get a user-friendly error message based on the exception
  static String getErrorMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();
    
    if (errorString.contains('timeout')) {
      return 'Connection timeout. The server is taking too long to respond. Please check your internet connection and try again.';
    }
    
    if (errorString.contains('socket') || errorString.contains('network')) {
      return 'Cannot connect to server. Please ensure:\n• Your internet connection is active\n• The backend server is running\n• Your firewall allows the connection';
    }
    
    if (errorString.contains('unauthorized') || errorString.contains('401')) {
      return 'Authentication failed. Please log in again.';
    }
    
    if (errorString.contains('forbidden') || errorString.contains('403')) {
      return 'Access denied. You don\'t have permission for this action.';
    }
    
    if (errorString.contains('not found') || errorString.contains('404')) {
      return 'Resource not found. Please contact support.';
    }
    
    // Return cleaned error message
    return error.toString()
        .replaceFirst('TeamException: ', '')
        .replaceFirst('Exception: ', '')
        .replaceFirst('TimeoutException: ', '')
        .trim();
  }
}
