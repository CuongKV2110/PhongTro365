import 'package:phongtro/models/account.dart';

abstract class EditState {}

class EditInitial extends EditState {}

class EditLoading extends EditState {}

class EditSuccess extends EditState {
  Account account;

  EditSuccess(this.account);
}

class EditError extends EditState {}
