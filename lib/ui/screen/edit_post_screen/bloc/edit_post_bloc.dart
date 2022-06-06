import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/account.dart';
import '../../../../models/room.dart';
import 'edit_post_state.dart';

class EditPostBloc extends Cubit<EditPostState> {
  EditPostBloc() : super(EditPostInitial());

  late Account account;
  late Room room;

  Future<void> EditPost(
    int status,
    String owner,
    String type,
    String people,
    String acreage,
    String cost,
    String location,
    String phone,
    String water,
    String electricity,
    String internet,
    bool wifi,
    bool wc,
    bool time,
    bool vehicle,
    bool kitchen,
    bool fridge,
    bool washing,
    bool conditioning,
    String content,
    String postID,
  ) async {
    emit(EditPostLoading());
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    await post.doc(postID).update({
      'status': status,
      'owner': owner,
      'type': type,
      'people': people,
      'acreage': acreage,
      'cost': cost,
      'location': location,
      'phone': phone,
      'water': water,
      'electricity': electricity,
      'internet': internet,
      'wifi': wifi,
      'wc': wc,
      'time': time,
      'vehicle': vehicle,
      'kitchen': kitchen,
      'fridge': fridge,
      'washing': washing,
      'conditioning': conditioning,
      'content': content,
    });
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> res =
        await fireStore.collection('posts').doc(postID).get();
    room = Room.fromJson(res.data()!);
    emit(EditPostSuccess(room));
  }
}
