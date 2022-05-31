import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String commentId;
  String postId;
  String userId;
  String content;
  int time;

  Comment({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.content,
    required this.time,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
