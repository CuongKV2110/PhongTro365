import 'package:json_annotation/json_annotation.dart';
import 'package:phongtro/models/comment.dart';

part 'write.g.dart';

@JsonSerializable()
class Write {
  String writeId;
  String content;
  String userId;
  int timePost;
  int status;
  List<String>? comment;

  Write({
    required this.writeId,
    required this.content,
    required this.userId,
    required this.timePost,
    required this.status,
    required this.comment,
  });

  factory Write.fromJson(Map<String, dynamic> json) => _$WriteFromJson(json);

  Map<String, dynamic> toJson() => _$WriteToJson(this);
}
