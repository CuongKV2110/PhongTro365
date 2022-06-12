import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/singleton.dart';
import 'write_state.dart';

class WriteBloc extends Cubit<WriteState> {
  WriteBloc() : super(WriteInitial());

  Future<void> writePost(String content) async {
    emit(WriteLoading());

    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    var document = fireStore.collection('writes').doc();
    CollectionReference write = FirebaseFirestore.instance.collection('writes');
    await write.doc(document.id).set({
      'writeId': document.id,
      'content': content,
      'userId': Singleton.instance.account.userID,
      'timePost': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'status': 0,
      'comment': [],
    });

    emit(WriteLoaded());
  }
}
