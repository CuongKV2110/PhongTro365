import 'package:json_annotation/json_annotation.dart';
import 'package:phongtro/models/room.dart';
part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  final List<Room> data;

  PostResponse(this.data);

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  Map<String, dynamic> toJSON() => _$PostResponseToJson(this);
}
