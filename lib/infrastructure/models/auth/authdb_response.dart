
class AuthDbResponse {
  final int id;
  final String name;
  final String username;
  final String? surname;
  final String token;

  AuthDbResponse({
    required this.id,
    required this.name,
    required this.username,
    required this.surname,
    required this.token,
  });

  factory AuthDbResponse.fromJson(Map<String, dynamic> json) => AuthDbResponse(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    surname: json["surname"] == null ? json["surname"] : null,
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "surname": surname,
    "token": token,
  };
}
