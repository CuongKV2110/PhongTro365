import '../../../../models/room.dart';

abstract class NewFeedState {
  final List<Room> data;
  NewFeedState({required this.data});
}

class NewFeedInitial extends NewFeedState {
  NewFeedInitial() : super(data: []);
}

class NewFeedLoading extends NewFeedState {
  NewFeedLoading() : super(data: []);
}

class NewFeedLoaded extends NewFeedState {
  final List<Room> data;
  NewFeedLoaded({required this.data}) : super(data: data);
}

class NewFeedError extends NewFeedState {
  final String error;
  NewFeedError({required this.error}) : super(data: []);
}
