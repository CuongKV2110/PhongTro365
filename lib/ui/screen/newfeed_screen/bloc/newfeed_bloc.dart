import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/result.dart';
import 'package:phongtro/models/write_detail.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/account.dart';
import '../../../../models/comment.dart';
import '../../../../models/room.dart';
import '../../../../models/write.dart';
import 'newfeed_state.dart';

class NewFeedBloc extends Cubit<NewFeedState> {
  NewFeedBloc() : super(NewFeedInitial());

  Future<void> getData() async {
    emit(NewFeedLoading());
    List<Room> list = await PostProvider.getData();
    List<Room> listfinal = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].status == 1) {
        listfinal.add(list[i]);
      }
    }

    Room room = Room(
      status: 0,
      owner: "Chung chủ",
      type: 'Phòng trống',
      people: 1,
      acreage: 1,
      cost: 1,
      location: "ADADAD",
      phone: 1,
      water: 1,
      electricity: 1,
      internet: 1,
      wifi: true,
      wc: true,
      time: true,
      vehicle: true,
      kitchen: true,
      fridge: true,
      washing: true,
      conditioning: true,
      content: '',
      imgUrl: [],
      comment: [],
      postID: 'postID',
      userID: 'userID',
      userAvatar: 'userAvatar',
      userName: 'userName',
      timePost: 2,
    );

    for (int i = 0; i < listfinal.length - 1; i++) {
      for (int j = i + 1; j < listfinal.length; j++) {
        if (listfinal[i].timePost < listfinal[j].timePost) {
          room = listfinal[i];
          listfinal[i] = listfinal[j];
          listfinal[j] = room;
        }
      }
    }

    final FirebaseFirestore data = FirebaseFirestore.instance;
    List<Write> listWrite = await PostProvider.getWrite();
    List<Write> listWriteWatting = [];
    List<WriteDetail> listWriteDetail = [];

    for (int i = 0; i < listWrite.length; i++) {
      if (listWrite[i].status == 1) {
        listWriteWatting.add(listWrite[i]);
      }
    }

    List<Account> listAccount = [];
    var resAccount = await data.collection("users").get();
    listAccount =
        resAccount.docs.map((doc) => Account.fromJson(doc.data())).toList();

    for (int i = 0; i < listAccount.length; i++) {
      for (int j = 0; j < listWriteWatting.length; j++) {
        WriteDetail writeDetail = WriteDetail(listWriteWatting[j], '', '');
        if (listWriteWatting[j].userId == listAccount[i].userID) {
          writeDetail.avt = listAccount[i].avt;
          writeDetail.username = listAccount[i].displayName;
          listWriteDetail.add(writeDetail);
        }
      }
    }

    WriteDetail writeDetail = WriteDetail(
      Write(
          writeId: 'writeId',
          content: 'content',
          userId: 'userId',
          timePost: 1,
          status: 0,
          comment: []),
      'avt',
      'username',
    );
    for (int i = 0; i < listWriteDetail.length - 1; i++) {
      for (int j = i + 1; j < listWriteDetail.length; j++) {
        if (listWriteDetail[i].write.timePost <
            listWriteDetail[j].write.timePost) {
          writeDetail = listWriteDetail[i];
          listWriteDetail[i] = listWriteDetail[j];
          listWriteDetail[j] = writeDetail;
        }
      }
    }

    Result result = Result(listfinal, listWriteDetail);

    emit(NewFeedLoaded(result));
  }

  Future<void> getWatting() async {
    emit(NewFeedLoading());
    List<Room> list = await PostProvider.getData();
    List<Room> listWatting = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].status == 0) {
        listWatting.add(list[i]);
      }
    }

    Room room = Room(
      status: 0,
      owner: "Chung chủ",
      type: 'Phòng trống',
      people: 1,
      acreage: 1,
      cost: 1,
      location: "ADADAD",
      phone: 1,
      water: 1,
      electricity: 1,
      internet: 1,
      wifi: true,
      wc: true,
      time: true,
      vehicle: true,
      kitchen: true,
      fridge: true,
      washing: true,
      conditioning: true,
      content: '',
      imgUrl: [],
      comment: [],
      postID: 'postID',
      userID: 'userID',
      userAvatar: 'userAvatar',
      userName: 'userName',
      timePost: 2,
    );

    for (int i = 0; i < listWatting.length - 1; i++) {
      for (int j = i + 1; j < listWatting.length; j++) {
        if (listWatting[i].timePost < listWatting[j].timePost) {
          room = listWatting[i];
          listWatting[i] = listWatting[j];
          listWatting[j] = room;
        }
      }
    }

    final FirebaseFirestore data = FirebaseFirestore.instance;
    List<Write> listWrite = await PostProvider.getWrite();
    List<Write> listWriteWatting = [];
    List<WriteDetail> listWriteDetail = [];

    for (int i = 0; i < listWrite.length; i++) {
      if (listWrite[i].status == 0) {
        listWriteWatting.add(listWrite[i]);
      }
    }

    List<Account> listAccount = [];
    var resAccount = await data.collection("users").get();
    listAccount =
        resAccount.docs.map((doc) => Account.fromJson(doc.data())).toList();

    for (int i = 0; i < listAccount.length; i++) {
      for (int j = 0; j < listWriteWatting.length; j++) {
        WriteDetail writeDetail = WriteDetail(listWriteWatting[j], '', '');
        if (listWriteWatting[j].userId == listAccount[i].userID) {
          writeDetail.avt = listAccount[i].avt;
          writeDetail.username = listAccount[i].displayName;
          listWriteDetail.add(writeDetail);
        }
      }
    }

    WriteDetail writeDetail = WriteDetail(
      Write(
          writeId: 'writeId',
          content: 'content',
          userId: 'userId',
          timePost: 1,
          status: 0,
          comment: []),
      'avt',
      'username',
    );
    for (int i = 0; i < listWriteDetail.length - 1; i++) {
      for (int j = i + 1; j < listWriteDetail.length; j++) {
        if (listWriteDetail[i].write.timePost <
            listWriteDetail[j].write.timePost) {
          writeDetail = listWriteDetail[i];
          listWriteDetail[i] = listWriteDetail[j];
          listWriteDetail[j] = writeDetail;
        }
      }
    }

    Result result = Result(listWatting, listWriteDetail);
    emit(NewFeedLoaded(result));
  }

  Future<void> deletePost(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).delete();

    CollectionReference comments =
        FirebaseFirestore.instance.collection('comments');
    List<Comment> listComments;
    final FirebaseFirestore data = FirebaseFirestore.instance;

    var resComments = await data.collection("comments").get();
    listComments =
        resComments.docs.map((doc) => Comment.fromJson(doc.data())).toList();

    for (int i = 0; i < listComments.length; i++) {
      if (listComments[i].postId == postID) {
        comments.doc(listComments[i].commentId).delete();
      }
    }

    getData();
  }

  Future<void> deleteWrite(String postID) async {
    CollectionReference writes =
        FirebaseFirestore.instance.collection('writes');

    writes.doc(postID).delete();

    getData();
  }

  Future<void> deletePost1(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).delete();

    getWatting();
  }

  Future<void> showWrite(String postID) async {
    CollectionReference writes =
        FirebaseFirestore.instance.collection('writes');

    writes.doc(postID).update({
      'status': 1,
    });

    getWatting();
  }

  Future<void> showPost(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).update({
      'status': 1,
    });

    getWatting();
  }

  Future<void> hidePost(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).update({
      'status': 0,
    });
    getData();
  }

  Future<void> hideWrite(String postID) async {
    CollectionReference writes =
        FirebaseFirestore.instance.collection('writes');

    writes.doc(postID).update({
      'status': 0,
    });
    getData();
  }

  void refreshData() async {
    getData();
  }

  void refreshWatting() async {
    getWatting();
  }

  void dispose() {
    close();
  }
}
