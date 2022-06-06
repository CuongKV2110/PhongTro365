import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginProcessing extends LoginState {}

class LoginSuccess extends LoginState {
  /*int typeLogin;

  LoginSuccess(this.typeLogin);*/
}

class LoginError extends LoginState {}

class LoginAdmin extends LoginState {}
