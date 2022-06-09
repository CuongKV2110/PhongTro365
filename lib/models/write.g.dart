// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Write _$WriteFromJson(Map<String, dynamic> json) => Write(
      writeId: json['writeId'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      timePost: json['timePost'] as int,
      status: json['status'] as int,
      comment:
          (json['comment'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WriteToJson(Write instance) => <String, dynamic>{
      'writeId': instance.writeId,
      'content': instance.content,
      'userId': instance.userId,
      'timePost': instance.timePost,
      'status': instance.status,
      'comment': instance.comment,
    };
