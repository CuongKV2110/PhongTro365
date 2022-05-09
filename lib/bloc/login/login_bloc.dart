import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/validate_helper.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  String errorMessage = '';
  int i = 0;

  void dispose() {
    close();
  }

  Future<String> inputData() async {
    final User user = FirebaseAuth.instance.currentUser!;
    final String uid = user.uid.toString();
    print(uid);
    return uid;
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
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          await inputData();
          yield LoginSuccess();
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
