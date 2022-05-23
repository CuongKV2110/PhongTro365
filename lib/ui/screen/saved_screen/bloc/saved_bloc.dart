import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/saved_screen/bloc/saved_event.dart';
import '../../../../models/room.dart';
import 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial());

  @override
  Stream<SavedState> mapEventToState(SavedEvent event) async* {
    List<Room> newList = await PostProvider.getData();

    if (event is DeletePost) {
      yield SavedLoading();

      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      await fireStore.collection('posts').doc(event.postID).delete();

      List<String> list = Singleton.instance.account.post;
      for (int i = 0; i < list.length; i++) {
        if (list.contains(event.postID)) {
          Singleton.instance.account.post.remove(event.postID);
          await fireStore
              .collection('users')
              .doc(Singleton.instance.account.userID)
              .update(
            {'post': Singleton.instance.account.post},
          );
        }
      }
      await fireStore.collection('users').doc(event.postID).delete();

      yield SavedLoaded(newList);
    }
    if (event is GetData) {
      yield SavedLoading();
      newList = await PostProvider.getData();

      yield SavedLoaded(newList);
    }
  }

/*Future<void> getData() async {
    emit(SavedLoading());

    List<Room> newList = await PostProvider.getData();

    emit(SavedLoaded(newList));
  }*/

/* Future<void> deletePost() async {
    emit(SavedLoading());

    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    DocumentSnapshot<Map<String, dynamic>> res =
    await fireStore.collection('posts').doc(event.postId).get();

    emit(SavedLoaded(newList));
  }*/
}
