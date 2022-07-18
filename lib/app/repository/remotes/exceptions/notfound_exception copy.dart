import 'http_exception.dart';

class NotFoundException extends HttpException {
  NotFoundException([message]) : super(message, "NotFound Request: ");
}
