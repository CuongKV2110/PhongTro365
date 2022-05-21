import 'package:flutter/material.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpProcessing extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {}
