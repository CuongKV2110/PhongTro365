import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  String email;
  String password;
  String userID;
  String displayName;
  String avt;
  String phoneNumber;
  String address;
  List<String> post;

  Account({
    required this.email,
    required this.password,
    required this.userID,
    required this.displayName,
    required this.avt,
    required this.phoneNumber,
    required this.address,
    required this.post,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
