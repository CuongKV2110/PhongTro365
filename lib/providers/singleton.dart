import 'package:phongtro/models/account.dart';

class Singleton {
  static final Singleton instance = Singleton._internal();

  Account account = Account(
    email: '',
    password: '',
    userID: '',
    displayName: '',
    avt:
        'https://vi.seaicons.com/wp-content/uploads/2017/03/Users-Folder-icon.png',
    post: [],
  );

  factory Singleton() {
    return instance;
  }

  Singleton._internal();
}
