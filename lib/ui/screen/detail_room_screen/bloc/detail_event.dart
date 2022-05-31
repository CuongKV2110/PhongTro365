import 'package:phongtro/models/comment.dart';

abstract class DetailEvent {}

class GetData extends DetailEvent {
  late String postId;

  GetData(this.postId);
}

class AddComment extends DetailEvent {
  Comment comment;

  AddComment(this.comment);
}

class LoadComment extends DetailEvent {
  List<Comment> list;

  LoadComment(this.list);
}
