import '../../../../../models/room.dart';

abstract class AccountPostedState {
  final List<Room> data;
  AccountPostedState({required this.data});
}

class AccountPostedInitial extends AccountPostedState {
  AccountPostedInitial() : super(data: []);
}

class AccountPostedLoading extends AccountPostedState {
  AccountPostedLoading() : super(data: []);
}

class AccountPostedLoaded extends AccountPostedState {
  final List<Room> data;
  AccountPostedLoaded({required this.data}) : super(data: data);
}

class AccountPostedError extends AccountPostedState {
  final String error;
  AccountPostedError({required this.error}) : super(data: []);
}
