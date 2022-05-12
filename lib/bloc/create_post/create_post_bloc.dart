import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_post_event.dart';
import 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial());
  String errorMessage = '';

  void dispose() {
    close();
  }

  @override
  Stream<CreatePostState> mapEventToState(CreatePostEvent event) async* {
    if (event is CreatePost) {
      errorMessage = '';
      yield CreatePostProcessing();

      if (event.content.isEmpty) {
        errorMessage = 'Content trống';
        yield CreatePostError();
        return;
      } else {
        try {
          FirebaseFirestore fireStore = FirebaseFirestore.instance;
          var document = fireStore.collection('posts').doc();
          CollectionReference post =
              FirebaseFirestore.instance.collection('posts');
          await post.doc(document.id).set({
            'owner': event.owner,
            'peolpe': event.people,
            'acreage': event.acreage,
            'cost': event.cost,
            'location': event.location,
            'phone': event.phone,
            'water': event.water,
            'electricity': event.electricity,
            'wifi': event.wifi,
            'wc': event.wc,
            'time': event.time,
            'vehicle': event.vehicle,
            'kitchen': event.kitchen,
            'fridge': event.fridge,
            'washing': event.washing,
            'conditioning': event.conditioning,
            'content': event.content,
            'postID': document.id,
          });
          yield CreatePostSuccess();
        } on FirebaseAuthException catch (e) {
          yield CreatePostError();
        }
      }
    }
  }
}
