import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  String accessToken;
  int accessTokenExpiresAt;
  String refreshToken;
  int refreshTokenExpiresAt;
  Session(this.accessToken, this.accessTokenExpiresAt, this.refreshToken,
      this.refreshTokenExpiresAt);

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
