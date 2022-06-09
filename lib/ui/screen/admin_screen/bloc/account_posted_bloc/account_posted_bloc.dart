import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/models/write_detail.dart';
import '../../../../../models/write.dart';
import '../../../../../providers/post_provider.dart';
import 'account_posted_state.dart';

class AccountPostedBloc extends Cubit<AccountPostedState> {
  AccountPostedBloc() : super(AccountPostedInitial());

  Future<void> loadListPosted(Account account) async {
    emit(AccountPostedLoading());
    List<Room> listRoom = await PostProvider.getData();
    List<Room> listRoomFinal = [];
    for (int i = 0; i < listRoom.length; i++) {
      if (listRoom[i].userID == account.userID) {
        listRoomFinal.add(listRoom[i]);
      }
    }

    List<Write> listWrite = await PostProvider.getWrite();
    List<Write> listWriteFinal = [];

    for (int i = 0; i < listWrite.length; i++) {
      if (listWrite[i].userId == account.userID) {
        listWriteFinal.add(listWrite[i]);
      }
    }

    List<WriteDetail> listWriteDetail = [];
    for (int i = 0; i < listWriteFinal.length; i++) {
      WriteDetail writeDetail = WriteDetail(
        Write(
            writeId: 'writeId',
            content: 'content',
            userId: 'userId',
            timePost: 1,
            status: 0,
            comment: []),
        'avt',
        'username',
      );
      writeDetail.avt = account.avt;
      writeDetail.username = account.displayName;
      writeDetail.write = listWriteFinal[i];
      listWriteDetail.add(writeDetail);
    }

    emit(AccountPostedLoaded(listRoomFinal, listWriteDetail));
  }

  void dispose() {
    close();
  }
}
