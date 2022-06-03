import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/providers/singleton.dart';

import '../../../../helpers/validate_helper.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  String errorMessage = '';
  int i = 0;
  Singleton singleton = Singleton();
  late Account profile;

  void dispose() {
    close();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginNormal) {
      errorMessage = '';
      yield LoginProcessing();

      if (event.email.isEmpty) {
        errorMessage = 'Email trống';
        yield LoginError();
        return;
      }

      if (!ValidationHelper.isEmailValid(event.email)) {
        errorMessage = 'Email không hợp lệ';
        yield LoginError();
        return;
      }

      if (event.password.isEmpty) {
        errorMessage = 'Mật khẩu trống';
        yield LoginError();
        return;
      }

      if (event.password.length < 6) {
        errorMessage = 'Mật khẩu phải từ 6 kí tự trở lên';
        yield LoginError();
        return;
      }
      if (ValidationHelper.isEmailValid(event.email) &&
          event.password.length >= 6) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          if (userCredential != null) {
            String? userID = userCredential.user?.uid;
            FirebaseFirestore fireStore = FirebaseFirestore.instance;
            DocumentSnapshot<Map<String, dynamic>> res =
                await fireStore.collection('users').doc(userID).get();
            profile = Account.fromJson(res.data()!);
            singleton.account.userID = userID!;
            singleton.account.displayName = profile.displayName;
            singleton.account.email = profile.email;
            singleton.account.post = profile.post;
            singleton.account.password = profile.password;
            singleton.account.avt = profile.avt;

            yield LoginSuccess();
          } else {
            yield LoginError();
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            errorMessage = 'Email không tồn tại';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Mật khẩu không chính xác';
          }
          yield LoginError();
        }
      }
    }

    if (event is LoginFacebook) {
      errorMessage = '';
      print("Login FB: ");
    }

    if (event is LoginGoogle) {
      errorMessage = '';
      print("Login GG: ");
    }
  }
}
