import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phongtro/models/comment.dart';
import '../models/room.dart';

class PostProvider {
  static Future<List<Room>> getData() async {
    List<Room> list;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("posts").get();
    list = post.docs.map((doc) => Room.fromJson(doc.data())).toList();
    return list;
  }

  static Future<List<Comment>> getComment() async {
    List<Comment> listComment;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var res = await data.collection("comments").get();
    listComment = res.docs.map((doc) => Comment.fromJson(doc.data())).toList();
    return listComment;
  }
}
