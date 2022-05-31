import 'package:json_annotation/json_annotation.dart';
import 'package:phongtro/models/comment.dart';
part 'room.g.dart';

@JsonSerializable()
class Room {
  String owner;
  String type;
  String people;
  String acreage;
  String cost;
  String location;
  String phone;
  String water;
  String electricity;
  String internet;
  bool wifi;
  bool wc;
  bool time;
  bool vehicle;
  bool kitchen;
  bool fridge;
  bool washing;
  bool conditioning;
  String content;
  List<String>? imgUrl;
  List<String>? comment;
  String postID;
  String userID;
  String userAvatar;
  String userName;
  int timePost;

  Room({
    required this.owner,
    required this.type,
    required this.people,
    required this.acreage,
    required this.cost,
    required this.location,
    required this.phone,
    required this.water,
    required this.electricity,
    required this.internet,
    required this.wifi,
    required this.wc,
    required this.time,
    required this.vehicle,
    required this.kitchen,
    required this.fridge,
    required this.washing,
    required this.conditioning,
    required this.content,
    required this.imgUrl,
    required this.comment,
    required this.postID,
    required this.userID,
    required this.userAvatar,
    required this.userName,
    required this.timePost,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
