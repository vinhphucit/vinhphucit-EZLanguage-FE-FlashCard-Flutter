import 'http_exception.dart';

class InternalServerException extends HttpException {
  InternalServerException([message])
      : super(message, "Internal Server Error: ");
}
