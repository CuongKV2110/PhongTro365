import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/providers/account_provider.dart';
import '../../../../../providers/post_provider.dart';
import 'account_posted_state.dart';

class AccountPostedBloc extends Cubit<AccountPostedState> {
  AccountPostedBloc() : super(AccountPostedInitial());

  Future<void> loadListPosted(Account account) async {
    emit(AccountPostedLoading());
    List<Room> list = await PostProvider.getData();
    List<Room> listfinal = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].userID == account.userID) {
        listfinal.add(list[i]);
      }
    }
    emit(AccountPostedLoaded(data: listfinal));
  }

  void dispose() {
    close();
  }
}
