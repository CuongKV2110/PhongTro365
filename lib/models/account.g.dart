// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      email: json['email'] as String,
      password: json['password'] as String,
      userID: json['userID'] as String,
      displayName: json['displayName'] as String,
      avt: json['avt'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      post: (json['post'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userID': instance.userID,
      'displayName': instance.displayName,
      'avt': instance.avt,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'post': instance.post,
    };
