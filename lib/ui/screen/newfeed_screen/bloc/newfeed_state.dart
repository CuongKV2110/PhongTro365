import '../../../../models/room.dart';

abstract class NewFeedState {

}

class NewFeedInitial extends NewFeedState {

}

class NewFeedLoading extends NewFeedState {
}

class NewFeedLoaded extends NewFeedState {
  final List<Room> listRoom;

  NewFeedLoaded(this.listRoom);
}


class NewFeedError extends NewFeedState {
}
