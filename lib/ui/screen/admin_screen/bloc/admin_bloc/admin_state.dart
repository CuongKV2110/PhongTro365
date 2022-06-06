import '../../../../../models/room.dart';


abstract class AdminState {
  final List<Room> data;
  AdminState({required this.data});
}

class AdminInitial extends AdminState {
  AdminInitial() : super(data: []);
}

class AdminLoading extends AdminState {
  AdminLoading() : super(data: []);
}

class AdminLoaded extends AdminState {
  final List<Room> data;
  AdminLoaded({required this.data}) : super(data: data);
}

class AdminError extends AdminState {
  final String error;
  AdminError({required this.error}) : super(data: []);
}
