import '../../../../../models/room.dart';

abstract class WattingState {
  final List<Room> data;
  WattingState({required this.data});
}

class WattingInitial extends WattingState {
  WattingInitial() : super(data: []);
}

class WattingLoading extends WattingState {
  WattingLoading() : super(data: []);
}

class WattingLoaded extends WattingState {
  final List<Room> data;
  WattingLoaded({required this.data}) : super(data: data);
}

class WattingError extends WattingState {
  final String error;
  WattingError({required this.error}) : super(data: []);
}
