import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phongtro/models/account.dart';

class AccountProvider {
  static Future<List<Account>> getAccount() async {
    List<Account> listAccount;

    final FirebaseFirestore data = FirebaseFirestore.instance;

    var post = await data.collection("users").get();
    listAccount = post.docs.map((doc) => Account.fromJson(doc.data())).toList();

    return listAccount;
  }
}
