abstract class CreatePostEvent {
  CreatePostEvent([List props = const []]);

  List<Object> get props => [props];
}

class CreatePost extends CreatePostEvent {
  final String owner;
  final String type;

  final String people;

  final String acreage;

  final String cost;

  final String location;
  final String phone;

  final String water;

  final String electricity;

  final String internet;

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
  final String postID;
  final String userID;
  final String userAvatar;
  final String userName;
  final int timePost;

  CreatePost(
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
    this.postID,
    this.userID,
    this.userAvatar,
    this.userName,
    this.timePost,
  );
}
