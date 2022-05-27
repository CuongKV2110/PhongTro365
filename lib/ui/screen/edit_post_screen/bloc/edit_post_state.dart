import '../../../../models/room.dart';

abstract class EditPostState {}

class EditPostInitial extends EditPostState {}

class EditPostLoading extends EditPostState {}

class EditPostSuccess extends EditPostState {
  Room room;

  EditPostSuccess(this.room);
}

class EditPostError extends EditPostState {}
