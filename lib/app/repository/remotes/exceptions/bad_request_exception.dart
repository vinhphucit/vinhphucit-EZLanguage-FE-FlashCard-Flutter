import 'http_exception.dart';

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
