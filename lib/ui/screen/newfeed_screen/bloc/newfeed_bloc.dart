import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/room.dart';
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
    emit(NewFeedLoaded(data: listfinal));
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
    emit(NewFeedLoaded(data: listWatting));
  }

  Future<void> deletePost(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).delete();

    getData();
  }

  Future<void> deletePost1(String postID) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    posts.doc(postID).delete();

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
