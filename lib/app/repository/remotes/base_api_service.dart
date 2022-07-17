import 'dart:convert';

import 'package:fe_ezlang_flashcard/app/models/error.dart';
import 'package:fe_ezlang_flashcard/app/utils/shared_pref_utils.dart';

import 'exceptions/bad_request_exception.dart';
import 'exceptions/internal_server_exception.dart';
import 'exceptions/unauthorised_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiService {
  get accessToken async {
    return await SharedPrefUtils.getAccessToken();
  }

  Future<dynamic> get(String url) async {
    final uri = Uri.parse(url);
    var token = await accessToken;
    final response = await http.get(
      uri,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      },
    );
    return returnResponse(response);
  }

  Future<dynamic> post(String url, dynamic body) async {
    final uri = Uri.parse(url);
    var token = await accessToken;
    var rqBody = (body == null ? null : json.encode(body));
    final response = await http.post(uri,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
        body: rqBody);
    return returnResponse(response);
  }

  Future<dynamic> put(String url, dynamic body) async {
    final uri = Uri.parse(url);
    var token = await accessToken;
    var rqBody = (body == null ? null : json.encode(body));
    final response = await http.put(uri,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
        body: rqBody);
    return returnResponse(response);
  }

  Future<void> delete(String url) async {
    final uri = Uri.parse(url);
    var token = await accessToken;
    final response = await http.delete(
      uri,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      },
    );

    return returnResponse(response);
  }

  String buildQuery(
      {String? orderBy, int? limit, int? offset, List<String>? filters}) {
    String query = '';
    if (orderBy != null) {
      query += ((query == "" ? "sort=" : "&sort=") + (orderBy.toString()));
    }
    if (limit != null) {
      query += ((query == "" ? "" : "&") + ("limit=$limit"));
    }

    if (offset != null) {
      query += ((query == "" ? "" : "&") + ("start=$offset"));
    }

    if (filters != null) {
      query += ((query == "" ? "" : "&") +
          filters.map((filter) => ("query=$filter")).join("&"));
    }
    if (query != "") return ("?$query");
    return '';
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson;
    responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 204:
        return;
      case 400:
        throw BadRequestException(ErrorRes.fromJson(responseJson).description);
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(
            ErrorRes.fromJson(responseJson).description);
      case 500:
      default:
        throw InternalServerException(
            ErrorRes.fromJson(responseJson).description);
    }
  }
}
