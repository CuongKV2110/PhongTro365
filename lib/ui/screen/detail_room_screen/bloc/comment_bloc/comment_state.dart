import 'package:phongtro/models/comment.dart';
import 'package:phongtro/models/comment_detail.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<CommentDetail> listComment;

  CommentLoaded(this.listComment);
}

class CommentError extends CommentState {}
