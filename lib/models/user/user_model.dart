enum UserType {
  customer,
  user,
  admin,
}

class User {
  final int id;
  final String token;
  final String name;
  final UserType type;

  User({
    required this.id,
    required this.token,
    required this.name,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // define the user type
    late UserType type;
    switch (json['type']) {
      case 0:
        type = UserType.admin;
        break;
      case 1:
        type = UserType.user;
        break;
      case 2:
        type = UserType.customer;
        break;
    }
    return User(
      id: json['id'],
      token: json['token'],
      name: json['name'],
      type: type,
    );
  }
}
