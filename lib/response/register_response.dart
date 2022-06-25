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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['msg'] = this.msg;
    return data;
  }
}
