class RegisterRequestModel {
  String? email;
  String? username;
  String? password;

  RegisterRequestModel({this.email, this.username, this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
      };
}
