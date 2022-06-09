import 'package:phongtro/models/write_detail.dart';

import '../../../../../models/room.dart';

abstract class AccountPostedState {}

class AccountPostedInitial extends AccountPostedState {}

class AccountPostedLoading extends AccountPostedState {}

class AccountPostedLoaded extends AccountPostedState {
  final List<Room> room;
  final List<WriteDetail> write;

  AccountPostedLoaded(this.room, this.write);
}

class AccountPostedError extends AccountPostedState {}
