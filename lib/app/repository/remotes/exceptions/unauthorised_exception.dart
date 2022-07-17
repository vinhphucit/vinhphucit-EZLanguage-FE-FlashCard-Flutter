import 'http_exception.dart';

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}
