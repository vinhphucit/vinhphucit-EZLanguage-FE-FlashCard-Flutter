class ErrorRes {
  String description;
  int code;

  ErrorRes(this.code, this.description);

  factory ErrorRes.fromJson(dynamic json) {
    return ErrorRes(
      json['code'] as int,
      json['description'] as String,
    );
  }
}
