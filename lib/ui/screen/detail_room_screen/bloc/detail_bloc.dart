import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/comment.dart';
import 'package:phongtro/providers/post_provider.dart';

import '../../../../models/room.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial());
  String errorMessage = '';
  final PostProvider postProvider = PostProvider();
  late Room room;

  void dispose() {
    close();
  }

  List<String> listIDComment = [];
  List<String> listComment = [];

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is GetData) {
      yield DetailProcessing();
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      DocumentSnapshot<Map<String, dynamic>> res =
          await fireStore.collection('posts').doc(event.postId).get();

      if (res != null) {
        room = Room.fromJson(res.data()!);
        yield DetailSuccess(room);
        return;
      } else {
        yield DetailError();
      }
    }

    if (event is AddComment) {
      yield DetailProcessing();

      CollectionReference post = FirebaseFirestore.instance.collection('posts');

      CollectionReference comments =
          FirebaseFirestore.instance.collection('comments');

      var document = FirebaseFirestore.instance.collection('comments').doc();

      comments.doc(document.id).set({
        'commentId': document.id,
        'postId': event.comment.postId,
        'userId': event.comment.userId,
        'content': event.comment.content,
        'time': event.comment.time,
      });

      DocumentSnapshot<Map<String, dynamic>> res = await FirebaseFirestore
          .instance
          .collection('posts')
          .doc(event.comment.postId)
          .get();

      room = Room.fromJson(res.data()!);
      listIDComment = room.comment!;

      listIDComment.add(document.id);

      await post.doc(event.comment.postId).update({'comment': listIDComment});

      yield DetailSuccess(room);
    }

    if (event is LoadComment) {
      yield DetailProcessing();
      List<Comment> newList = await PostProvider.getComment();
      print(newList[0].content);
      print(newList[1].content);
      yield DetailSuccess(room);
    }
  }
}
