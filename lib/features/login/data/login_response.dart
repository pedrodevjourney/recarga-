class LoginResponse {
  const LoginResponse({
    required this.token,
    this.userId,
    this.email,
  });

  final String token;
  final String? userId;
  final String? email;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final token = json['token'] as String? ??
        json['accessToken'] as String? ??
        json['access_token'] as String? ??
        '';
    return LoginResponse(
      token: token,
      userId: json['userId']?.toString() ?? json['id']?.toString(),
      email: json['email'] as String?,
    );
  }
}
