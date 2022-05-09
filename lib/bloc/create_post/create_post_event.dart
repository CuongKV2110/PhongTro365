abstract class CreatePostEvent {
  CreatePostEvent([List props = const []]);

  List<Object> get props => [props];
}

class CreatePost extends CreatePostEvent {
  final String people ;
  final String acreage ;
  final String cost ;
  final String location ;
  final String water ;
  final String electricity ;
  final String internet ;
  final String content;

  CreatePost(this.people, this.acreage, this.cost, this.location,
      this.water, this.electricity, this.internet, this.content);
}

