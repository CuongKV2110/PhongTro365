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
          CollectionReference post =
              FirebaseFirestore.instance.collection('posts');
          post.doc('6HIWUXmxyPGeFOpbxB1g').set({
            'peolpe': event.people,
            'acreage': event.acreage,
            'cost': event.cost,
            'location': event.location,
            'water': event.water,
            'electricity': event.electricity,
            'internet': event.internet,
            'content': event.content,
          });
          yield CreatePostSuccess();
        } on FirebaseAuthException catch (e) {
          yield CreatePostError();
        }
      }
    }
  }
}
