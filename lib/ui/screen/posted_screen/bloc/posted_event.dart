abstract class PostedEvent {
  PostedEvent([List props = const []]);

  List<Object> get props => [props];
}

class GetData extends PostedEvent {}
