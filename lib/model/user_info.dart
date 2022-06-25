import 'package:json_annotation/json_annotation.dart';
part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String? email;
  String? username;

  UserInfo({this.email, this.username});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  //1. flutter clean
  //2. flutter pub get

//3. flutter pub run build_runner build

}
