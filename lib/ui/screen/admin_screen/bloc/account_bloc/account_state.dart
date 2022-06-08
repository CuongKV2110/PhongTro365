import '../../../../../models/account.dart';
import '../../../../../models/room.dart';

abstract class AccountState {
  final List<Account> data;
  AccountState({required this.data});
}

class AccountInitial extends AccountState {
  AccountInitial() : super(data: []);
}

class AccountLoading extends AccountState {
  AccountLoading() : super(data: []);
}

class AccountLoaded extends AccountState {
  final List<Account> data;
  AccountLoaded({required this.data}) : super(data: data);
}

class AccountError extends AccountState {
  final String error;
  AccountError({required this.error}) : super(data: []);
}
