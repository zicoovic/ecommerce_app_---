class AuthResponseModel {
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  AuthResponseModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'expiresAtUtc': expiresAtUtc,
      'refreshToken': refreshToken,
    };
  }
}