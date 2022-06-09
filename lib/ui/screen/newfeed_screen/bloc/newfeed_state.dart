import 'package:phongtro/models/result.dart';

import '../../../../models/room.dart';
import '../../../../models/write.dart';

abstract class NewFeedState {}

class NewFeedInitial extends NewFeedState {}

class NewFeedLoading extends NewFeedState {}

class NewFeedLoaded extends NewFeedState {
  final Result result;

  NewFeedLoaded(this.result);
}

class NewFeedError extends NewFeedState {}
