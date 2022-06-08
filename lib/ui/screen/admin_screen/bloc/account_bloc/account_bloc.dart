import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/providers/account_provider.dart';
import '../../../../../providers/post_provider.dart';
import 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountInitial());

  Future<void> getData() async {
    emit(AccountLoading());
    List<Account> newList = await AccountProvider.getAccount();

    for (int i = 0; i < newList.length; i++) {
      if (newList[i].email == 'admin@gmail.com') {
        newList.remove(newList[i]);
      }
    }

    emit(AccountLoaded(data: newList));
  }

  Future<void> deleteAccount(Account account) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    users.doc(account.userID).delete();

    for (int i = 0; i < account.post.length; i++) {
      posts.doc(account.post[i]).delete();
    }

    getData();
  }

  void refreshData() async {
    print('Refresh data');
    getData();
  }

  void dispose() {
    close();
  }
}
