class UserResponse {
  const UserResponse({
    required this.id,
    this.email,
    this.fullName,
  });

  final String id;
  final String? email;
  final String? fullName;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id']?.toString() ?? '',
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
    );
  }
}
