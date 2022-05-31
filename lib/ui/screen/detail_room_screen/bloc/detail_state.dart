import 'package:flutter/material.dart';
import 'package:phongtro/models/comment.dart';

import '../../../../models/room.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailProcessing extends DetailState {}

class DetailSuccess extends DetailState {
  Room room;

  DetailSuccess(this.room);
}

class DetailError extends DetailState {}
