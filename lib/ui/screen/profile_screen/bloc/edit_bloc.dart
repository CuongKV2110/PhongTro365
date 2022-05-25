import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/profile_screen/bloc/edit_state.dart';

import '../../../../models/account.dart';
import '../../../../models/room.dart';

class EditBloc extends Cubit<EditState> {
  EditBloc() : super(EditInitial());

  late Account account;
  late Room room;

  Future<void> editProfile(displayName, phoneNumber, address, avt) async {
    emit(EditLoading());
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference post = FirebaseFirestore.instance.collection('posts');

    File file = File(avt);
    int time = DateTime.now().millisecondsSinceEpoch;
    String ref = 'users/${users.id}/image_$time.png';
    await FirebaseStorage.instance.ref(ref).putFile(file);
    String imgDownloadURL =
        await FirebaseStorage.instance.ref(ref).getDownloadURL();

    await users.doc(Singleton.instance.account.userID).update({
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'address': address,
      'avt': imgDownloadURL,
    });

    for (int i = 0; i < Singleton.instance.account.post.length; i++) {
      await post.doc(Singleton.instance.account.post[i]).update({
        'userAvatar': imgDownloadURL,
        'userName': displayName,
      });
    }

    DocumentSnapshot<Map<String, dynamic>> res = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(Singleton.instance.account.userID)
        .get();
    account = Account.fromJson(res.data()!);

    Singleton.instance.account.address = account.address;
    Singleton.instance.account.displayName = account.displayName;
    Singleton.instance.account.phoneNumber = account.phoneNumber;
    Singleton.instance.account.avt = account.avt;

    /*DocumentSnapshot<Map<String, dynamic>> resPost = await FirebaseFirestore
        .instance
        .collection('posts')
        .doc(Singleton.instance.account.userID)
        .get();
    room = Room.fromJson(resPost.data()!);*/

    for (int i = 0; i < account.post.length; i++) {
      await post.doc(account.post[i]).update({
        'userName': displayName,
      });
    }

    emit(EditSuccess(Singleton.instance.account));
  }
}
