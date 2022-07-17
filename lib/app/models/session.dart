class Session {
  String accessToken;
  int accessTokenExpiresAt;
  String refreshToken;
  int refreshTokenExpiresAt;
  Session(this.accessToken, this.accessTokenExpiresAt, this.refreshToken,
      this.refreshTokenExpiresAt);

  factory Session.fromJson(dynamic json) {
    return Session(
      json['accessToken'] as String,
      json['accessTokenExpiresAt'] as int,
      json['refreshToken'] as String,
      json['refreshTokenExpiresAt'] as int,
    );
  }
  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'accessTokenExpiresAt': accessTokenExpiresAt,
        'refreshToken': refreshToken,
        'refreshTokenExpiresAt': refreshTokenExpiresAt,
      };
}
