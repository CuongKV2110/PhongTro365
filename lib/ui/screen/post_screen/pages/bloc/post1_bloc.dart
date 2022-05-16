import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/post_screen/pages/bloc/post1_event.dart';
import 'post1_state.dart';

class Post1Bloc extends Bloc<Post1Event, Post1State> {
  Post1Bloc() : super(Post1Initial());
  String errorMessage = '';

  void dispose() {
    close();
  }

  @override
  Stream<Post1State> mapEventToState(Post1Event event) async* {
    if (event is CheckData) {
      yield Post1Processing();
      if (event.people.isEmpty) {
        errorMessage = 'Sức chứa không được trống';
        yield Post1Error();
        return;
      } else if (event.acreage.isEmpty) {
        errorMessage = 'Diện tích không được trống';
        yield Post1Error();
        return;
      } else if (event.cost.isEmpty) {
        errorMessage = 'Giá phòng không được trống';
        yield Post1Error();
        return;
      } else if (event.location.isEmpty) {
        errorMessage = 'Địa chỉ không được trống';
        yield Post1Error();
        return;
      } else if (event.phone.isEmpty) {
        errorMessage = 'SĐT không được trống';
        yield Post1Error();
        return;
      } else {
        yield Post1Success();
      }
    }
  }
}
