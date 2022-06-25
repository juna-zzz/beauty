class User {
  String? email;

  String? username;
  String? password;

  User({this.email, this.username, this.password});

//converting json file from server to an object in dart
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

//converting the data to send into server in json
  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
