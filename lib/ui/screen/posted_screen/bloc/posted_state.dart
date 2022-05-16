import 'package:flutter/material.dart';

import '../../../../models/room.dart';

@immutable
abstract class PostedState {}

class PostedInitial extends PostedState {}

class PostedProcessing extends PostedState {}

class PostedSuccess extends PostedState {
  final List<Room> data;

  PostedSuccess(this.data);
}

class PostedError extends PostedState {}
