import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/comment_detail.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../../models/room.dart';
import 'comment_state.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(CommentInitial());

  Future<void> LoadComment(Room room) async {
    emit(CommentLoading());
    print(room.comment);
    if (room.comment == []) {
      emit(CommentError());
    } else {
      List<CommentDetail> newList = await PostProvider.getComment(room);
      emit(CommentLoaded(newList));
    }
  }
}
