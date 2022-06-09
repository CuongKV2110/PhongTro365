import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phongtro/models/comment.dart';
import 'package:phongtro/models/comment_detail.dart';
import '../models/account.dart';
import '../models/room.dart';
import '../models/write.dart';

class PostProvider {
  static Future<List<Room>> getDataStatus() async {
    List<Room> list;
    List<Room> resultList = [];
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("posts").get();
    list = post.docs.map((doc) => Room.fromJson(doc.data())).toList();

    for (int i = 0; i < list.length; i++) {
      if (list[i].status == 1) {
        resultList.add(list[i]);
      }
    }
    return resultList;
  }

  static Future<List<Room>> getData() async {
    List<Room> list;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("posts").get();
    list = post.docs.map((doc) => Room.fromJson(doc.data())).toList();

    return list;
  }

  static Future<List<Write>> getWrite() async {
    List<Write> list;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var writes = await data.collection("writes").get();
    list = writes.docs.map((doc) => Write.fromJson(doc.data())).toList();

    return list;
  }

  static Future<List<CommentDetail>> getComment(Room room) async {
    List<Comment> listComment = [];
    List<Comment> resultComment = [];
    List<Account> listAccount = [];
    List<CommentDetail> listCommentDetail = [];

    final FirebaseFirestore data = FirebaseFirestore.instance;

    var res = await data.collection("comments").get();
    listComment = res.docs.map((doc) => Comment.fromJson(doc.data())).toList();

    for (int i = 0; i < listComment.length; i++) {
      for (int j = 0; j < room.comment!.length; j++) {
        if (listComment[i].commentId == room.comment![j]) {
          resultComment.add(listComment[i]);
        }
      }
    }

    var resAccount = await data.collection("users").get();
    listAccount =
        resAccount.docs.map((doc) => Account.fromJson(doc.data())).toList();

    for (int i = 0; i < listAccount.length; i++) {
      for (int j = 0; j < resultComment.length; j++) {
        CommentDetail commentDetail = CommentDetail(resultComment[j], '', '');
        if (commentDetail.comment.userId == listAccount[i].userID) {
          commentDetail.avt = listAccount[i].avt;
          commentDetail.username = listAccount[i].displayName;
          listCommentDetail.add(commentDetail);
        }
      }
    }

    CommentDetail cmt;
    for (int i = 0; i < listCommentDetail.length - 1; i++) {
      for (int j = i + 1; j < listCommentDetail.length; j++) {
        if (listCommentDetail[i].comment.time <
            listCommentDetail[j].comment.time) {
          cmt = listCommentDetail[i];
          listCommentDetail[i] = listCommentDetail[j];
          listCommentDetail[j] = cmt;
        }
      }
    }
    return listCommentDetail;
  }
}
