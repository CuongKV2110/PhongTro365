import '../../../../models/room.dart';

abstract class ShareState {}

class ShareInitial extends ShareState {}

class ShareLoading extends ShareState {}

class ShareLoaded extends ShareState {
  final List<Room> listRoom;

  ShareLoaded(this.listRoom);
}

class ShareError extends ShareState {}
