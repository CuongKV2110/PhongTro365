import 'package:phongtro/models/comment.dart';

abstract class CreatePostEvent {
  CreatePostEvent([List props = const []]);

  List<Object> get props => [props];
}

class CreatePost extends CreatePostEvent {
  final int status;
  final String owner;
  final String type;

  final int people;

  final int acreage;

  final int cost;

  final String location;
  final int phone;

  final int water;

  final int electricity;

  final int internet;

  final bool wifi;
  final bool wc;
  final bool time;
  final bool vehicle;
  final bool kitchen;
  final bool fridge;
  final bool washing;
  final bool conditioning;
  final String content;
  final List<String> imgUrl;
  final List<String> comment;
  final String postID;
  final String userID;
  final String userAvatar;
  final String userName;
  final int timePost;

  CreatePost(
    this.status,
    this.owner,
    this.type,
    this.people,
    this.acreage,
    this.cost,
    this.location,
    this.phone,
    this.water,
    this.electricity,
    this.internet,
    this.wifi,
    this.wc,
    this.time,
    this.vehicle,
    this.kitchen,
    this.fridge,
    this.washing,
    this.conditioning,
    this.content,
    this.imgUrl,
    this.comment,
    this.postID,
    this.userID,
    this.userAvatar,
    this.userName,
    this.timePost,
  );
}
