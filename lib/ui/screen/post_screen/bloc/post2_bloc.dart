import 'package:flutter_bloc/flutter_bloc.dart';
import 'post2_event.dart';
import 'post2_state.dart';

class Post2Bloc extends Bloc<Post2Event, Post2State> {
  Post2Bloc() : super(Post2Initial());
  String errorMessage = '';

  void dispose() {
    close();
  }

  @override
  Stream<Post2State> mapEventToState(Post2Event event) async* {
    if (event is CheckData) {
      yield Post2Processing();
      if (event.water.isEmpty) {
        errorMessage = 'Tiền nước không được trống';
        yield Post2Error();
        return;
      } else if (event.electricity.isEmpty) {
        errorMessage = 'Tiền điện không được trống';
        yield Post2Error();
        return;
      } else if (event.internet.isEmpty) {
        errorMessage = 'Tiền mạng không được trống';
        yield Post2Error();
        return;
      } else {
        yield Post2Success();
      }
    }
  }
}
