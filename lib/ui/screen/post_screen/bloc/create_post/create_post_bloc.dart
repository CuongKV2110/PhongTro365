import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/singleton.dart';
import 'create_post_event.dart';
import 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial());
  String errorMessage = '';
  String postId = '';
  List<String> listImg = [];

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
          CollectionReference users =
              FirebaseFirestore.instance.collection('users');

          File file1 = File(event.imgUrl[0]);
          File file2 = File(event.imgUrl[1]);
          File file3 = File(event.imgUrl[2]);
          int time = DateTime.now().millisecondsSinceEpoch;
          String ref1 = 'posts/${document.id}/image1_$time.png';
          String ref2 = 'posts/${document.id}/image2_$time.png';
          String ref3 = 'posts/${document.id}/image3_$time.png';
          await FirebaseStorage.instance.ref(ref1).putFile(file1);
          await FirebaseStorage.instance.ref(ref2).putFile(file2);
          await FirebaseStorage.instance.ref(ref3).putFile(file3);
          String imgDownloadURL1 =
              await FirebaseStorage.instance.ref(ref1).getDownloadURL();
          String imgDownloadURL2 =
              await FirebaseStorage.instance.ref(ref2).getDownloadURL();
          String imgDownloadURL3 =
              await FirebaseStorage.instance.ref(ref3).getDownloadURL();
          listImg.add(imgDownloadURL1);
          listImg.add(imgDownloadURL2);
          listImg.add(imgDownloadURL3);
          await post.doc(document.id).set({
            'owner': event.owner,
            'type': event.type,
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
            'imgUrl': listImg,
            'userID': event.userID,
            'userAvatar': Singleton.instance.account.avt,
            'userName': Singleton.instance.account.displayName,
            'timePost': event.timePost,
          });

          Singleton.instance.account.post.add(document.id);

          await users.doc(Singleton.instance.account.userID).update({
            'post': Singleton.instance.account.post,
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
