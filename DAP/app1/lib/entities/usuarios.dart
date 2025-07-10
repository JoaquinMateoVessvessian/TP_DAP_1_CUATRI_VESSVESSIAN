class Usuarios {
  String? name;
  String username;
  String? mail;
  String password;

  Usuarios({
    this.name,
    required this.username,
    this.mail,
    required this.password,
  });

  @override
  String toString() {
    return 'Usuarios{name: $name, username: $username, mail: $mail, password: $password}';
  }
}
