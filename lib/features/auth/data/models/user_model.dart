class UserModel {
  final String id;
  final String email;
  final String name;
  final String? picture;
  final String accessToken;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      picture: json['picture'],
      accessToken: json['accessToken'],
    );
  }
}
