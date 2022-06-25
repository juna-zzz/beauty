class RegisterResponse {
  String? firstname;
  String? email;
  String? password;
  String? msg;

  RegisterResponse({this.firstname, this.email, this.password, this.msg});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    email = json['email'];
    password = json['password'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['email'] = email;
    data['password'] = password;
    data['msg'] = msg;
    return data;
  }
}
