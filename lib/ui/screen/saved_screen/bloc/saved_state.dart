import '../../../../models/room.dart';

abstract class SavedState {}

class SavedInitial extends SavedState {}

class SavedLoading extends SavedState {}

class SavedLoaded extends SavedState {
  final List<Room> listRoom;

  SavedLoaded(this.listRoom);
}

class SavedError extends SavedState {}
