import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_post_event.dart';
import 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial());
  String errorMessage = '';
  String postId = '';

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

          File file = File(event.imgUrl);
          int time = DateTime.now().millisecondsSinceEpoch;
          String ref = 'posts/${document.id}/image_$time.png';
          await FirebaseStorage.instance.ref(ref).putFile(file);
          String imgDownloadURL =
              await FirebaseStorage.instance.ref(ref).getDownloadURL();
          await post.doc(document.id).set({
            'owner': event.owner,
            'people': event.people,
            'acreage': event.acreage,
            'cost': event.cost,
            'location': event.location,
            'phone': event.phone,
            'water': event.water,
            'electricity': event.electricity,
            'internet': event.internet,
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
            'imgUrl': imgDownloadURL,
          });
          postId = document.id;
          yield CreatePostSuccess();
        } on FirebaseAuthException catch (e) {
          yield CreatePostError();
        }
      }
    }
  }
}
