import 'package:phongtro/models/comment.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> listComment;

  CommentLoaded(this.listComment);
}

class CommentError extends CommentState {}
