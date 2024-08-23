import 'package:logger/logger.dart';

final _logger = Logger();

// ignore: camel_case_types
class l {
  static void d(String message) {
    _logger.d(message);
  }

  static void e(String message) {
    _logger.e(message);
  }

  static void i(String message) {
    _logger.i(message);
  }

  static void w(String message) {
    _logger.w(message);
  }

  static void v(String message) {
    _logger.t(message);
  }
}