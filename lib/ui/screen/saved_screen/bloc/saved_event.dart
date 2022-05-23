abstract class SavedEvent {}

class GetData extends SavedEvent {}

class DeletePost extends SavedEvent {
  String postID;

  DeletePost(this.postID);
}
