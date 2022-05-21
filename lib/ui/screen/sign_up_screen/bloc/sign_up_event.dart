abstract class SignUpEvent {
  SignUpEvent([List props = const []]);

  List<Object> get props => [props];
}

class SignUpNormal extends SignUpEvent {
  final String email;
  final String password;
  final String userName;
  final String rePassWord;

  SignUpNormal(
    this.email,
    this.password,
    this.userName,
    this.rePassWord,
  );
}

class SignUpFacebook extends SignUpEvent {}

class SignUpGoogle extends SignUpEvent {}
