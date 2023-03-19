enum UserType {
  customer,
  agent,
  admin,
}

class User {
  final String id;
  final String token;
  final String name;
  final String email;
  final String user;
  final UserType type;

  User({
    required this.id,
    required this.token,
    required this.name,
    required this.type,
    required this.email,
    required this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // define the user type
    late UserType type;
    switch (json['isadmin']) {
      case "1":
        type = UserType.admin;
        break;
      case "0":
        type = UserType.agent;
        break;
      case "2":
        type = UserType.customer;
        break;
    }
    return User(
      id: json['id'],
      token: json['token'],
      name: json['name'],
      email: json['email'],
      user: json['user'],
      type: type,
    );
  }
}
