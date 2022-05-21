import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/validate_helper.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());
  String errorMessage = '';

  void dispose() {
    close();
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpNormal) {
      yield SignUpProcessing();
      errorMessage = '';
      if (event.userName.isEmpty) {
        errorMessage = 'Tên hiển thị trống';
        yield SignUpError();
        return;
      }
      if (event.email.isEmpty) {
        errorMessage = 'Email trống';
        yield SignUpError();
        return;
      }

      if (!ValidationHelper.isEmailValid(event.email)) {
        errorMessage = 'Email không hợp lệ';
        yield SignUpError();
        return;
      }

      if (event.password.isEmpty) {
        errorMessage = 'Mật khẩu trống';
        yield SignUpError();
        return;
      }

      if (event.password.length < 6) {
        errorMessage = 'Mật khẩu phải từ 6 kí tự trở lên';
        yield SignUpError();
        return;
      }

      if (event.password != event.rePassWord) {
        errorMessage = 'Mật khẩu không trùng nhau';
        yield SignUpError();
        return;
      }

      if (ValidationHelper.isEmailValid(event.email) &&
          event.password.length >= 6) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);

          if (userCredential != null) {
            String? userID = userCredential.user?.uid;
            CollectionReference users =
                FirebaseFirestore.instance.collection('users');
            users.doc(userID).set({
              'email': event.email,
              'password': event.password,
              'displayName': event.userName,
              'userID': userID,
              'avt':
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgSmojUgwjIB87c4Q0hLCAyl__oiTySWGWJUZtUNHlHjBALLzTsu_vMHYMaEwLts4QEoo&usqp=CAU',
              'post': [],
            });
            yield SignUpSuccess();
          } else {
            yield SignUpError();
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            errorMessage = 'Email đã tồn tại. Vui lòng nhập email khác';
          }
          yield SignUpError();
        }
      }
    }

    if (event is SignUpFacebook) {
      errorMessage = '';
      print("Sign up with FB: ");
    }

    if (event is SignUpGoogle) {
      errorMessage = '';
      print("Sign up with GG: ");
    }
  }
}
