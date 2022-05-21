abstract class NewFeedEvent {
  NewFeedEvent([List props = const []]);

  List<Object> get props => [props];
}

class GetData extends NewFeedEvent {
  late String postId;
  GetData(this.postId);
}
