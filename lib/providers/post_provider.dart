import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phongtro/models/response/post_response.dart';

import '../models/room.dart';

class PostProvider {
  Future<List<Room>> getData() async {
    List<Room> list;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("posts").get();
    list = post.docs.map((doc) => Room.fromJson(doc.data())).toList();
    return list;
  }
}
