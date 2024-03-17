
class User {
  final int id;
  final String username;
  final String name;
  final String? surname;

  User({
    required this.id,
    required this.username,
    required this.name,
    this.surname,
  });
}