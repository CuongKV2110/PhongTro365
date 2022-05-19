import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';

import '../../../../models/room.dart';
import 'posted_event.dart';
import 'posted_state.dart';

class PostedBloc extends Bloc<PostedEvent, PostedState> {
  PostedBloc() : super(PostedInitial());
  String errorMessage = '';
  final PostProvider postProvider = PostProvider();
  late Room room;
  void dispose() {
    close();
  }

  @override
  Stream<PostedState> mapEventToState(PostedEvent event) async* {
    if (event is GetData) {
      yield PostedProcessing();
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      DocumentSnapshot<Map<String, dynamic>> res =
          await fireStore.collection('posts').doc(event.postId).get();

      if (res != null) {
        room = Room.fromJson(res.data()!);
        yield PostedSuccess(room);
        return;
      } else {
        yield PostedError();
      }
    }
  }
}
