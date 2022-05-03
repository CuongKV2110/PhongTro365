abstract class LoginEvent {
  LoginEvent([List props = const []]);

  List<Object> get props => [props];
}

class LoginFacebook extends LoginEvent {}

class LoginGoogle extends LoginEvent {}
