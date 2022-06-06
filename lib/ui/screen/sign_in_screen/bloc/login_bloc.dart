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
          String? userID = userCredential.user?.uid;
          FirebaseFirestore fireStore = FirebaseFirestore.instance;
          DocumentSnapshot<Map<String, dynamic>> res =
              await fireStore.collection('users').doc(userID).get();
          profile = Account.fromJson(res.data()!);

          if (event.email == 'admin@gmail.com' && event.password == '123456') {
            singleton.account.userID = userID!;
            singleton.account.displayName = "Admin";
            singleton.account.email = profile.email;
            singleton.account.post = profile.post;
            singleton.account.password = profile.password;
            singleton.account.avt =
                'https://scontent.fhan2-2.fna.fbcdn.net/v/t39.30808-6/273469711_1381265349000700_350127149901403282_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_aid=0&_nc_ohc=_A4Vpw40C8EAX90Y077&_nc_ht=scontent.fhan2-2.fna&oh=00_AT_hNMku-TFuOzpnYnAYWLOT1L7k0-OzahG1MAE68HrDfA&oe=62A378FE';
            yield LoginAdmin();
            return;
          } else {
            singleton.account.userID = userID!;
            singleton.account.displayName = profile.displayName;
            singleton.account.email = profile.email;
            singleton.account.post = profile.post;
            singleton.account.password = profile.password;
            singleton.account.avt = profile.avt;
            yield LoginSuccess();
            return;
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
