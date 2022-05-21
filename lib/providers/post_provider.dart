import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/room.dart';

class PostProvider {
  static Future<List<Room>> getData() async {
    List<Room> list;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("posts").get();
    list = post.docs.map((doc) => Room.fromJson(doc.data())).toList();
    return list;
  }
}
